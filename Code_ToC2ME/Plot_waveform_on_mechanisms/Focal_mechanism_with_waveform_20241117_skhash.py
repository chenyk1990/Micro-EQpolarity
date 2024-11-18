import os
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec
from obspy.imaging.beachball import beach
from obspy import read
import pandas as pd

# 设置目标事件ID
target_event_id = "20161104064824.680"
target_event_SKHASH_id = "1"
Fault_type = 'Strike_Slip_Fault'

# Step 1: 读取震源机制文件
def read_focal_mechanism(file_path):
    events = []
    with open(file_path, 'r') as f:
        for line in f:
            parts = line.split()
            event_id = parts[0]
            latitude = float(parts[1])
            longitude = float(parts[2])
            depth = float(parts[3])
            strike = float(parts[4])
            dip = float(parts[5])
            rake = float(parts[6])
            events.append({"event_id": event_id, "latitude": latitude, "longitude": longitude,
                           "depth": depth, "strike": strike, "dip": dip, "rake": rake})
    return events

# 震源机制文件路径
focal_mechanism_file = 'mt_solution_20241114_SKHASH_quality_A.txt'
events = read_focal_mechanism(focal_mechanism_file)

# 查找目标事件
target_event = next(event for event in events if event['event_id'] == target_event_id)
strike, dip, rake = target_event['strike'], target_event['dip'], target_event['rake']

# Step 2: 读取极性数据文件
def read_rays_file(csv_file_path, target_skhash_id):
    # 读取CSV文件
    df = pd.read_csv(csv_file_path)
    
    ray_paths = []
    seen_stations = set()

    # 筛选出目标事件的记录
    event_data = df[df['event_id'] == int(target_skhash_id)]
    
    for _, row in event_data.iterrows():
        # 从sta_code提取station_id（第一个点前的部分）
        station_id = row['sta_code'].split('.')[0]
        
        print(f"Full sta_code: {row['sta_code']}")
        print(f"Extracted station_id: {station_id}")
        print(f"Original azimuth: {row['azimuth']}")
        print(f"Original takeoff: {row['takeoff']}")
        print(f"Original polarity: {row['p_polarity']}")
        
        if station_id not in seen_stations:
            seen_stations.add(station_id)
            new_ray = {
                "station_id": station_id,
                "azimuth": float(row['azimuth']),
                "take_off_angle": float(row['takeoff']),
                "polarity": int(row['p_polarity'])
            }
            ray_paths.append(new_ray)
            print("\nAdded new ray path:")
            print(f"station_id: {new_ray['station_id']}")
            print(f"azimuth: {new_ray['azimuth']}")
            print(f"take_off_angle: {new_ray['take_off_angle']}")
            print(f"polarity: {new_ray['polarity']}")
            print("-" * 50)
    
    return ray_paths

# 读取极性数据
rays_file_path = '../HASH_Workflow/Automatically_EQpolarity/SKHASH/SKHASH/ToC2ME_demo/OUT/out_polinfo.csv'
ray_paths = read_rays_file(rays_file_path, target_event_SKHASH_id)

# Step 3: 创建图形和 GridSpec
fig = plt.figure(figsize=(15, 5))
gs = GridSpec(1, 6, figure=fig)  # 修改为 1 行 6 列
ax_mech = fig.add_subplot(gs[:, :4]) 

def plot_focal_mechanism_with_stations(ax, strike, dip, rake, ray_paths, beachball_size):
    # 绘制震源机制球
    beachball = beach([strike, dip, rake], width=beachball_size, linewidth=1, facecolor='grey', zorder=1)
    ax.add_collection(beachball)

    # 计算站点投影
    r = beachball_size / 2
    for ray in ray_paths:
        azimuth = (ray['azimuth'] + 180) % 360
        takeoff_angle = ray['take_off_angle']
        polarity = ray['polarity']
        station_id = ray['station_id']
        
        rp = r * np.sqrt(2) * np.sin(np.deg2rad(takeoff_angle) / 2) + 4.5
        x = rp * np.sin(np.radians(azimuth)) * np.sin(np.radians(takeoff_angle))
        y = rp * np.cos(np.radians(azimuth)) * np.sin(np.radians(takeoff_angle))
        
        ax.text(x, y, f" {station_id}", color='black', fontsize=8, ha='left', va='center')
        color = 'red' if polarity == 1 else 'green'
        marker = '^' if polarity == 1 else 'v'
        ax.scatter(x, y, color=color, marker=marker, zorder=2)
    ax.axis('off')
    ax.set_aspect('equal')

# 绘制震源机制与站点投影
plot_focal_mechanism_with_stations(ax_mech, strike, dip, rake, ray_paths, beachball_size=100)
ax_mech.set_title(f"{Fault_type} with Station Projections: {target_event_id}")

# Step 5: 读取波形文件
def read_waveform_files(event_folder):
    waveform_files = []
    for filename in os.listdir(event_folder):
        if filename.endswith(".DHZ.SAC"):
            station_id = filename.split('.')[1]
            waveform_files.append({"station_id": station_id, "path": os.path.join(event_folder, filename)})
    return waveform_files

event_folder = f"data_demo/{target_event_id}"
waveform_files = read_waveform_files(event_folder)

# Step 6: 绘制波形，分三列展示
sorted_rays = sorted(ray_paths, key=lambda x: (x['azimuth']+180)%360)
num_rays = len(sorted_rays)
col_size = num_rays // 3 + (num_rays % 3 > 0)

# 右侧三列的子图用于展示波形
for i in range(3):
    ax = fig.add_subplot(gs[0, i + 3])  # 使用 GridSpec 的第 4 到 6 列
    ray_subset = sorted_rays[i * col_size:(i + 1) * col_size]
    for ray in ray_subset:
        azimuth = (ray['azimuth'] + 180) % 360  # 使用调整后的方位角
        station_id = ray['station_id']
        polarity = ray['polarity']
        waveform_path = next((wf['path'] for wf in waveform_files if wf['station_id'] == station_id), None)
        
        if waveform_path:
            tr = read(waveform_path)[0]
            times = tr.times()
            color = 'red' if polarity == 1 else 'green'  # 设置波形的颜色根据极性
            ax.plot(times, tr.data * 600 + azimuth, color=color, alpha=0.6)  # 添加透明度

    # 设置每列的坐标轴
    ax.invert_yaxis()
    ax.set_xlim(4.6, 5.4)
    ax.set_xlabel("Time (s)")
    ax.set_title(f"Waveforms (Column {i + 1})")

# 设置左侧总的 y 轴标签
ax_mech.set_ylabel("Azimuth")

plt.tight_layout()

output_filename = f"focal_mechanism_{target_event_SKHASH_id}_{Fault_type}.png"

# 保存图片，设置DPI为300
plt.savefig(output_filename, dpi=300, bbox_inches='tight')
print(f"\nFigure saved as: {output_filename}")

plt.show()