<?xml version='1.0' encoding='utf-8'?>
<q:quakeml xmlns="http://quakeml.org/xmlns/bed/1.2" xmlns:q="http://quakeml.org/xmlns/quakeml/1.2">
  <eventParameters publicID="smi:org.gfz-potsdam.de/geofon/EventParameters">
    <event publicID="smi:org.gfz-potsdam.de/geofon/texnet2017cvmt">
      <preferredOriginID>smi:org.gfz-potsdam.de/geofon/NLL.20171011210513.416597.4944</preferredOriginID>
      <preferredMagnitudeID>smi:org.gfz-potsdam.de/geofon/NLL.20171011210513.416597.4944/netMag/ML(TexNet)</preferredMagnitudeID>
      <type>earthquake</type>
      <typeCertainty>known</typeCertainty>
      <description>
        <text>Western Texas</text>
        <type>region name</type>
      </description>
      <creationInfo>
        <agencyID>TXNet</agencyID>
        <author>scevent@sc3primary.beg.utexas.edu</author>
        <creationTime>2017-02-10T05:24:35.188601Z</creationTime>
      </creationInfo>
      <origin publicID="smi:org.gfz-potsdam.de/geofon/NLL.20171011210513.416597.4944">
        <time>
          <value>2017-02-10T05:22:09.269588Z</value>
        </time>
        <latitude>
          <value>32.07733154</value>
          <uncertainty>1.630596845</uncertainty>
        </latitude>
        <longitude>
          <value>-102.2393054</value>
          <uncertainty>0.8010741704</uncertainty>
        </longitude>
        <depth>
          <value>24.4547526</value>
          <uncertainty>1482.381206</uncertainty>
        </depth>
        <methodID>smi:org.gfz-potsdam.de/geofon/NonLinLoc</methodID>
        <earthModelID>smi:org.gfz-potsdam.de/geofon/iasp91</earthModelID>
        <quality>
          <associatedPhaseCount>28</associatedPhaseCount>
          <usedPhaseCount>12</usedPhaseCount>
          <usedStationCount>7</usedStationCount>
          <standardError>0.2363747185</standardError>
          <azimuthalGap>112.6404372</azimuthalGap>
          <secondaryAzimuthalGap>112.6404372</secondaryAzimuthalGap>
          <groundTruthLevel>-</groundTruthLevel>
          <minimumDistance>0.2660728829</minimumDistance>
          <maximumDistance>1.555313325</maximumDistance>
          <medianDistance>1.495585913</medianDistance>
        </quality>
        <evaluationMode>manual</evaluationMode>
        <evaluationStatus>final</evaluationStatus>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>Dino</author>
          <creationTime>2017-10-11T21:05:17.163379Z</creationTime>
        </creationInfo>
        <originUncertainty>
          <horizontalUncertainty>2473.641291</horizontalUncertainty>
          <minHorizontalUncertainty>1213.42504</minHorizontalUncertainty>
          <maxHorizontalUncertainty>2473.641291</maxHorizontalUncertainty>
          <azimuthMaxHorizontalUncertainty>178.4149188</azimuthMaxHorizontalUncertainty>
          <confidenceEllipsoid>
            <semiMajorAxisLength>3583741.097</semiMajorAxisLength>
            <semiMinorAxisLength>1499411.287</semiMinorAxisLength>
            <semiIntermediateAxisLength>2077637.1</semiIntermediateAxisLength>
            <majorAxisPlunge>129.4891166</majorAxisPlunge>
            <majorAxisAzimuth>-89.25365603</majorAxisAzimuth>
            <majorAxisRotation>93.52234813</majorAxisRotation>
          </confidenceEllipsoid>
        </originUncertainty>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608085.6592_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608085.6592</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>279.3373278</azimuth>
          <distance>0.2660728829</distance>
          <timeResidual>-0.09270405667</timeResidual>
          <timeWeight>1.257758914</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608353.6594_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608353.6594</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>99.49898602</azimuth>
          <distance>0.9583378153</distance>
          <timeResidual>0.3006562623</timeResidual>
          <timeWeight>1.019026593</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608609.6596_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608609.6596</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>31.97776497</azimuth>
          <distance>1.168940104</distance>
          <timeResidual>0.1188273986</timeResidual>
          <timeWeight>1.063680242</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608779.6597_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608779.6597</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>140.3302751</azimuth>
          <distance>1.495585913</distance>
          <timeResidual>-0.1813992697</timeResidual>
          <timeWeight>1.069764944</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608914.6598_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608914.6598</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>140.3302751</azimuth>
          <distance>1.495585913</distance>
          <timeResidual>-1.550086752</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609044.6599_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609044.6599</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>243.3835363</azimuth>
          <distance>1.555313325</distance>
          <timeResidual>-1.042782562</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609172.6600_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609172.6600</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>243.3835363</azimuth>
          <distance>1.555313325</distance>
          <timeResidual>0.3277092004</timeResidual>
          <timeWeight>0.8839073505</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609296.6601_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609296.6601</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>34.45709859</azimuth>
          <distance>1.936613682</distance>
          <timeResidual>1.774213271</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609417.6602_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609417.6602</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>34.45709859</azimuth>
          <distance>1.936613682</distance>
          <timeResidual>1.765245997</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609657.6604_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609657.6604</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>346.8544039</azimuth>
          <distance>1.945415678</distance>
          <timeResidual>2.398892198</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609824.6605_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609824.6605</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>54.43283523</azimuth>
          <distance>2.176618147</distance>
          <timeResidual>4.241731267</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.610212.6608_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.610212.6608</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>177.2885388</azimuth>
          <distance>2.126143322</distance>
          <timeResidual>-0.01732860174</timeResidual>
          <timeWeight>0.8341203284</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.610335.6609_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.610335.6609</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>177.2885388</azimuth>
          <distance>2.126143322</distance>
          <timeResidual>0.5762636064</timeResidual>
          <timeWeight>0.7256038728</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.610461.6610_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.610461.6610</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>215.4592166</azimuth>
          <distance>2.082274198</distance>
          <timeResidual>-0.6001058232</timeResidual>
          <timeWeight>0.5912605502</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.610886.6613_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.610886.6613</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>241.8705581</azimuth>
          <distance>2.676278616</distance>
          <timeResidual>3.167691857</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611011.6614_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611011.6614</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>241.8705581</azimuth>
          <distance>2.676278616</distance>
          <timeResidual>2.382067676</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611141.6615_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611141.6615</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>262.752296</azimuth>
          <distance>2.696651028</distance>
          <timeResidual>3.647490204</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611263.6616_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611263.6616</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>262.752296</azimuth>
          <distance>2.696651028</distance>
          <timeResidual>1.804741023</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611387.6617_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611387.6617</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>204.4881483</azimuth>
          <distance>3.007119373</distance>
          <timeResidual>4.659546677</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611502.6618_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611502.6618</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>204.4881483</azimuth>
          <distance>3.007119373</distance>
          <timeResidual>2.739758813</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611621.6619_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611621.6619</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>204.4729006</azimuth>
          <distance>3.007204646</distance>
          <timeResidual>3.533787009</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611768.6620_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611768.6620</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>204.4729006</azimuth>
          <distance>3.007204646</distance>
          <timeResidual>4.534439278</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433039.7304_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433039.7304</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>279.3373278</azimuth>
          <distance>0.2660728829</distance>
          <timeResidual>0.06822587113</timeResidual>
          <timeWeight>1.306311942</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433341.7305_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433341.7305</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>99.49898602</azimuth>
          <distance>0.9583378153</distance>
          <timeResidual>-0.2205778235</timeResidual>
          <timeWeight>1.075339115</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.43347.7306_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.43347.7306</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>31.97776497</azimuth>
          <distance>1.168940104</distance>
          <timeResidual>0.02455334713</timeResidual>
          <timeWeight>1.225946485</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433594.7307_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433594.7307</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>346.8544039</azimuth>
          <distance>1.945415678</distance>
          <timeResidual>1.717457864</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433705.7308_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433705.7308</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>215.4592166</azimuth>
          <distance>2.082274198</distance>
          <timeResidual>0.3583681641</timeResidual>
          <timeWeight>0.947279664</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433803.7309_NLL.20171011210513.416597.4944">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433803.7309</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>54.43283523</azimuth>
          <distance>2.176618147</distance>
          <timeResidual>-1.922439803</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
      </origin>
      <magnitude publicID="smi:org.gfz-potsdam.de/geofon/NLL.20171011210513.416597.4944/netMag/ML(TexNet)">
        <mag>
          <value>1.852849349</value>
          <uncertainty>0.1883396983</uncertainty>
        </mag>
        <type>ML(TexNet)</type>
        <originID>smi:org.gfz-potsdam.de/geofon/NLL.20171011210513.416597.4944</originID>
        <methodID>smi:org.gfz-potsdam.de/geofon/Trimmed_mean,_overall_err_&lt;_0.2</methodID>
        <stationCount>4</stationCount>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>scmag@sc3primary.beg.utexas.edu</author>
          <creationTime>2020-10-16T18:24:03.080095Z</creationTime>
        </creationInfo>
      </magnitude>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608085.6592">
        <time>
          <value>2017-02-10T05:22:17.977485Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="ODSA" locationCode="00" channelCode="HH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_(3,1.0,15)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.608169Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608353.6594">
        <time>
          <value>2017-02-10T05:22:41.266807Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="SGCY" locationCode="00" channelCode="HH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_(3,1.0,15)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.608435Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608609.6596">
        <time>
          <value>2017-02-10T05:22:48.050548Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="POST" locationCode="00" channelCode="HH1"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_(3,1.0,15)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.608687Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608779.6597">
        <time>
          <value>2017-02-10T05:22:37.162462Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="OZNA" locationCode="00" channelCode="HHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_(3,1.0,15)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.608868Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.608914.6598">
        <time>
          <value>2017-02-10T05:22:56.950370Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="OZNA" locationCode="00" channelCode="HH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_(3,1.0,15)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.608995Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609044.6599">
        <time>
          <value>2017-02-10T05:22:37.122020Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="PECS" locationCode="00" channelCode="HHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_(3,2.0,8.0)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.609126Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609172.6600">
        <time>
          <value>2017-02-10T05:23:00.304847Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="PECS" locationCode="00" channelCode="HH1"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_(3,1.0,15)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.609249Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609296.6601">
        <time>
          <value>2017-02-10T05:23:11.178665Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="DKNS" locationCode="00" channelCode="HH1"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_(3,1.0,15)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.609375Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609417.6602">
        <time>
          <value>2017-02-10T05:22:45.171253Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="DKNS" locationCode="00" channelCode="HHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,5.0,15)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.609494Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609657.6604">
        <time>
          <value>2017-02-10T05:23:12.020912Z</value>
        </time>
        <waveformID networkCode="TA" stationCode="MSTX" channelCode="BHE"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,1.0,5)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.609768Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.609824.6605">
        <time>
          <value>2017-02-10T05:23:19.580017Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="APMT" locationCode="00" channelCode="HH1"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,1.0,5)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.609908Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.610212.6608">
        <time>
          <value>2017-02-10T05:23:14.073020Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="SAND" locationCode="00" channelCode="HH1"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,1.0,5)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.610292Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.610335.6609">
        <time>
          <value>2017-02-10T05:22:46.587448Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="SAND" locationCode="00" channelCode="HH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_(3,2.0,8.0)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.610413Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.610461.6610">
        <time>
          <value>2017-02-10T05:23:12.405666Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="ALPN" locationCode="00" channelCode="HH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,1.0,5)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.610539Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.610886.6613">
        <time>
          <value>2017-02-10T05:23:30.857490Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="VHRN" locationCode="00" channelCode="HH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,1.0,5)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.610966Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611011.6614">
        <time>
          <value>2017-02-10T05:22:55.955196Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="VHRN" locationCode="00" channelCode="HHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_(3,2.0,8.0)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.611089Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611141.6615">
        <time>
          <value>2017-02-10T05:23:31.840805Z</value>
        </time>
        <waveformID networkCode="US" stationCode="MNTX" locationCode="00" channelCode="BH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,1.0,5)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.611219Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611263.6616">
        <time>
          <value>2017-02-10T05:22:55.657894Z</value>
        </time>
        <waveformID networkCode="US" stationCode="MNTX" locationCode="00" channelCode="BHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_(3,2.0,8.0)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.611341Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611387.6617">
        <time>
          <value>2017-02-10T05:23:40.526054Z</value>
        </time>
        <waveformID networkCode="IM" stationCode="TX31" channelCode="BHE"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,1.0,5)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.611462Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611502.6618">
        <time>
          <value>2017-02-10T05:23:00.860343Z</value>
        </time>
        <waveformID networkCode="IM" stationCode="TX31" channelCode="BHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,1.0,5)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.611576Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611621.6619">
        <time>
          <value>2017-02-10T05:23:01.655567Z</value>
        </time>
        <waveformID networkCode="IM" stationCode="TX32" channelCode="BHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,1.0,5)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.611697Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170210160242.611768.6620">
        <time>
          <value>2017-02-10T05:23:40.403007Z</value>
        </time>
        <waveformID networkCode="IM" stationCode="TX32" channelCode="BHE"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,1.0,5)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-10T16:02:42.611891Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433039.7304">
        <time>
          <value>2017-02-10T05:22:14.436013Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="ODSA" locationCode="00" channelCode="HH"></waveformID>
        <phaseHint>P</phaseHint>
        <polarity>negative</polarity>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>chas</author>
          <creationTime>2017-04-25T18:33:55.433249Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433341.7305">
        <time>
          <value>2017-02-10T05:22:27.411016Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="SGCY" locationCode="00" channelCode="HH"></waveformID>
        <phaseHint>P</phaseHint>
        <polarity>negative</polarity>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>chas</author>
          <creationTime>2017-04-25T18:33:55.433424Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.43347.7306">
        <time>
          <value>2017-02-10T05:22:31.691373Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="POST" locationCode="00" channelCode="HH"></waveformID>
        <phaseHint>P</phaseHint>
        <polarity>positive</polarity>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>chas</author>
          <creationTime>2017-04-25T18:33:55.433544Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433594.7307">
        <time>
          <value>2017-02-10T05:22:45.244426Z</value>
        </time>
        <waveformID networkCode="TA" stationCode="MSTX" channelCode="BH"></waveformID>
        <phaseHint>P</phaseHint>
        <polarity>negative</polarity>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>chas</author>
          <creationTime>2017-04-25T18:33:55.433663Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433705.7308">
        <time>
          <value>2017-02-10T05:22:45.766517Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="ALPN" locationCode="00" channelCode="HH"></waveformID>
        <phaseHint>P</phaseHint>
        <polarity>positive</polarity>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>chas</author>
          <creationTime>2017-04-25T18:33:55.433774Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170425183355.433803.7309">
        <time>
          <value>2017-02-10T05:22:44.782548Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="APMT" locationCode="00" channelCode="HH1"></waveformID>
        <phaseHint>P</phaseHint>
        <polarity>positive</polarity>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>chas</author>
          <creationTime>2017-04-25T18:33:55.433874Z</creationTime>
        </creationInfo>
      </pick>
    </event>
  </eventParameters>
</q:quakeml>
