<?xml version='1.0' encoding='utf-8'?>
<q:quakeml xmlns="http://quakeml.org/xmlns/bed/1.2" xmlns:q="http://quakeml.org/xmlns/quakeml/1.2">
  <eventParameters publicID="smi:org.gfz-potsdam.de/geofon/EventParameters">
    <event publicID="smi:org.gfz-potsdam.de/geofon/texnet2017dfac">
      <preferredOriginID>smi:org.gfz-potsdam.de/geofon/NLL.20171012201218.4144.356</preferredOriginID>
      <preferredMagnitudeID>smi:org.gfz-potsdam.de/geofon/NLL.20171012201218.4144.356/netMag/ML(TexNet)</preferredMagnitudeID>
      <type>earthquake</type>
      <typeCertainty>known</typeCertainty>
      <description>
        <text>Western Texas</text>
        <type>region name</type>
      </description>
      <creationInfo>
        <agencyID>TXNet</agencyID>
        <author>scevent@sc3primary.beg.utexas.edu</author>
        <creationTime>2017-02-15T10:24:02.142535Z</creationTime>
      </creationInfo>
      <origin publicID="smi:org.gfz-potsdam.de/geofon/NLL.20171012201218.4144.356">
        <time>
          <value>2017-02-15T10:20:29.446417Z</value>
        </time>
        <latitude>
          <value>32.07550049</value>
          <uncertainty>1.645030747</uncertainty>
        </latitude>
        <longitude>
          <value>-102.2607422</value>
          <uncertainty>0.7417558007</uncertainty>
        </longitude>
        <depth>
          <value>7947.794596</value>
          <uncertainty>1981.12507</uncertainty>
        </depth>
        <methodID>smi:org.gfz-potsdam.de/geofon/NonLinLoc</methodID>
        <earthModelID>smi:org.gfz-potsdam.de/geofon/iasp91</earthModelID>
        <quality>
          <associatedPhaseCount>28</associatedPhaseCount>
          <usedPhaseCount>10</usedPhaseCount>
          <usedStationCount>5</usedStationCount>
          <standardError>0.1431115934</standardError>
          <azimuthalGap>112.2453018</azimuthalGap>
          <secondaryAzimuthalGap>112.2453018</secondaryAzimuthalGap>
          <groundTruthLevel>-</groundTruthLevel>
          <minimumDistance>0.2484816075</minimumDistance>
          <maximumDistance>1.538258592</maximumDistance>
          <medianDistance>1.180206111</medianDistance>
        </quality>
        <evaluationMode>manual</evaluationMode>
        <evaluationStatus>final</evaluationStatus>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@begws142</author>
          <creationTime>2017-10-12T20:12:20.059030Z</creationTime>
        </creationInfo>
        <originUncertainty>
          <horizontalUncertainty>2496.56013</horizontalUncertainty>
          <minHorizontalUncertainty>1121.044833</minHorizontalUncertainty>
          <maxHorizontalUncertainty>2496.56013</maxHorizontalUncertainty>
          <azimuthMaxHorizontalUncertainty>177.6004915</azimuthMaxHorizontalUncertainty>
          <confidenceEllipsoid>
            <semiMajorAxisLength>4107300.489</semiMajorAxisLength>
            <semiMinorAxisLength>1342402.111</semiMinorAxisLength>
            <semiIntermediateAxisLength>2584109.147</semiIntermediateAxisLength>
            <majorAxisPlunge>147.4539673</majorAxisPlunge>
            <majorAxisAzimuth>-81.06512912</majorAxisAzimuth>
            <majorAxisRotation>83.35296024</majorAxisRotation>
          </confidenceEllipsoid>
        </originUncertainty>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.746478.10380_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.746478.10380</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>280.4223771</azimuth>
          <distance>0.2484816075</distance>
          <timeResidual>0.07519482872</timeResidual>
          <timeWeight>1.26766243</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.746736.10381_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.746736.10381</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>280.4223771</azimuth>
          <distance>0.2484816075</distance>
          <timeResidual>-0.05796057615</timeResidual>
          <timeWeight>1.274099408</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.746875.10382_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.746875.10382</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>99.20557164</azimuth>
          <distance>0.9759729258</distance>
          <timeResidual>0.01224408194</timeResidual>
          <timeWeight>1.213307305</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747001.10383_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747001.10383</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>99.20557164</azimuth>
          <distance>0.9759729258</distance>
          <timeResidual>-0.08717251057</timeResidual>
          <timeWeight>1.049777115</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747131.10384_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747131.10384</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>32.66767886</azimuth>
          <distance>1.180206111</distance>
          <timeResidual>-2.497557716e-12</timeResidual>
          <timeWeight>1.175199589</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747295.10385_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747295.10385</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>32.66767886</azimuth>
          <distance>1.180206111</distance>
          <timeResidual>0.03430187326</timeResidual>
          <timeWeight>0.9934908445</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747425.10386_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747425.10386</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>243.1298742</azimuth>
          <distance>1.538258592</distance>
          <timeResidual>-0.1646212725</timeResidual>
          <timeWeight>0.8596754137</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747671.10388_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747671.10388</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>139.7422716</azimuth>
          <distance>1.505855279</distance>
          <timeResidual>0.9449126809</timeResidual>
          <timeWeight>0.1832839937</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747791.10389_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747791.10389</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>139.7422716</azimuth>
          <distance>1.505855279</distance>
          <timeResidual>0.1027204618</timeResidual>
          <timeWeight>0.8963336474</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747916.10390_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747916.10390</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>176.785612</azimuth>
          <distance>2.125253114</distance>
          <timeResidual>3.062700115</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748035.10391_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748035.10391</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>176.785612</azimuth>
          <distance>2.125253114</distance>
          <timeResidual>1.774669875</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748157.10392_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748157.10392</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>347.3769485</azimuth>
          <distance>1.943149023</distance>
          <timeResidual>2.69538411</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748308.10393_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748308.10393</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>347.3769485</azimuth>
          <distance>1.943149023</distance>
          <timeResidual>3.718740718</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748431.10394_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748431.10394</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>34.85577949</azimuth>
          <distance>1.948455705</distance>
          <timeResidual>2.877138006</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748546.10395_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748546.10395</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>34.85577949</azimuth>
          <distance>1.948455705</distance>
          <timeResidual>3.561140931</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74867.10396_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74867.10396</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>54.65868962</azimuth>
          <distance>2.19248533</distance>
          <timeResidual>3.288327145</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748788.10397_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748788.10397</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>54.65868962</azimuth>
          <distance>2.19248533</distance>
          <timeResidual>5.291742932</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74891.10398_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74891.10398</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>75.37660839</azimuth>
          <distance>2.279540023</distance>
          <timeResidual>6.077781382</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.749027.10399_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.749027.10399</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>75.37660839</azimuth>
          <distance>2.279540023</distance>
          <timeResidual>4.243414279</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74915.10400_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74915.10400</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>241.7094486</azimuth>
          <distance>2.659396949</distance>
          <timeResidual>3.80838506</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.749302.10401_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.749302.10401</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>241.7094486</azimuth>
          <distance>2.659396949</distance>
          <timeResidual>5.684492998</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74943.10402_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74943.10402</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>262.7307105</azimuth>
          <distance>2.678390844</distance>
          <timeResidual>5.374832326</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74955.10403_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74955.10403</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>262.7307105</azimuth>
          <distance>2.678390844</distance>
          <timeResidual>4.378703816</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.7498.10405_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.7498.10405</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>204.1754388</azimuth>
          <distance>2.997961802</distance>
          <timeResidual>4.924136264</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.749913.10406_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.749913.10406</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>204.1754388</azimuth>
          <distance>2.997961802</distance>
          <timeResidual>6.864193322</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.750028.10407_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.750028.10407</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>204.1601534</azimuth>
          <distance>2.998051286</distance>
          <timeResidual>4.527206582</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.75014.10408_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.75014.10408</pickID>
          <phase>S</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>204.1601534</azimuth>
          <distance>2.998051286</distance>
          <timeResidual>6.581681833</timeResidual>
          <timeWeight>0.0</timeWeight>
        </arrival>
        <arrival publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220214140.06337.10480_NLL.20171012201218.4144.356">
          <pickID>smi:org.gfz-potsdam.de/geofon/Pick#20170220214140.06337.10480</pickID>
          <phase>P</phase>
          <timeCorrection>0.0</timeCorrection>
          <azimuth>243.1298742</azimuth>
          <distance>1.538258592</distance>
          <timeResidual>-0.1108881739</timeResidual>
          <timeWeight>1.087170254</timeWeight>
        </arrival>
      </origin>
      <magnitude publicID="smi:org.gfz-potsdam.de/geofon/NLL.20171012201218.4144.356/netMag/ML(TexNet)">
        <mag>
          <value>1.630131788</value>
          <uncertainty>0.1205711556</uncertainty>
        </mag>
        <type>ML(TexNet)</type>
        <originID>smi:org.gfz-potsdam.de/geofon/NLL.20171012201218.4144.356</originID>
        <methodID>smi:org.gfz-potsdam.de/geofon/Trimmed_mean,_overall_err_&lt;_0.2</methodID>
        <stationCount>4</stationCount>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>scmag@sc3primary.beg.utexas.edu</author>
          <creationTime>2020-10-16T18:24:30.910386Z</creationTime>
        </creationInfo>
      </magnitude>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.746478.10380">
        <time>
          <value>2017-02-15T10:20:34.476175Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="ODSA" locationCode="00" channelCode="HHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,2.0</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.746675Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.746736.10381">
        <time>
          <value>2017-02-15T10:20:37.940383Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="ODSA" locationCode="00" channelCode="HH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,2.0</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.746818Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.746875.10382">
        <time>
          <value>2017-02-15T10:20:48.198450Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="SGCY" locationCode="00" channelCode="HHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,5.0)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.746955Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747001.10383">
        <time>
          <value>2017-02-15T10:21:01.707374Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="SGCY" locationCode="00" channelCode="HH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,5.0)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.747082Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747131.10384">
        <time>
          <value>2017-02-15T10:20:52.048826Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="POST" locationCode="00" channelCode="HHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,5.0)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.747246Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747295.10385">
        <time>
          <value>2017-02-15T10:21:08.516468Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="POST" locationCode="00" channelCode="HH1"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,5.0)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.747376Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747425.10386">
        <time>
          <value>2017-02-15T10:21:18.002510Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="PECS" locationCode="00" channelCode="HH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,5.0)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.747501Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747671.10388">
        <time>
          <value>2017-02-15T10:20:57.655691Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="OZNA" locationCode="00" channelCode="HHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,5.0)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.747747Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747791.10389">
        <time>
          <value>2017-02-15T10:21:17.468738Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="OZNA" locationCode="00" channelCode="HH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,5.0)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.747864Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.747916.10390">
        <time>
          <value>2017-02-15T10:21:35.742622Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="SAND" locationCode="00" channelCode="HH1"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,5.0)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.747991Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748035.10391">
        <time>
          <value>2017-02-15T10:21:06.999305Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="SAND" locationCode="00" channelCode="HHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,5.0)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.748110Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748157.10392">
        <time>
          <value>2017-02-15T10:21:05.416999Z</value>
        </time>
        <waveformID networkCode="TA" stationCode="MSTX" channelCode="BHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,5.0)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.748263Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748308.10393">
        <time>
          <value>2017-02-15T10:21:31.896499Z</value>
        </time>
        <waveformID networkCode="TA" stationCode="MSTX" channelCode="BHE"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,5.0)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.748385Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748431.10394">
        <time>
          <value>2017-02-15T10:21:31.186042Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="DKNS" locationCode="00" channelCode="HH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,5.0)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.748505Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748546.10395">
        <time>
          <value>2017-02-15T10:21:06.355648Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="DKNS" locationCode="00" channelCode="HHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,5.0)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.748625Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74867.10396">
        <time>
          <value>2017-02-15T10:21:09.437198Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="APMT" locationCode="00" channelCode="HHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,2.0</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.748746Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.748788.10397">
        <time>
          <value>2017-02-15T10:21:39.633666Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="APMT" locationCode="00" channelCode="HH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,2.0</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.748863Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74891.10398">
        <time>
          <value>2017-02-15T10:21:42.571662Z</value>
        </time>
        <waveformID networkCode="TA" stationCode="ABTX" channelCode="BHN"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW_HP(3,2.0</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.748986Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.749027.10399">
        <time>
          <value>2017-02-15T10:21:11.588844Z</value>
        </time>
        <waveformID networkCode="TA" stationCode="ABTX" channelCode="BHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,4.0,8)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.749103Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74915.10400">
        <time>
          <value>2017-02-15T10:21:16.375144Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="VHRN" locationCode="00" channelCode="HHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,4.0,8)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.749257Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.749302.10401">
        <time>
          <value>2017-02-15T10:21:51.568290Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="VHRN" locationCode="00" channelCode="HH1"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,4.0,8)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.749381Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74943.10402">
        <time>
          <value>2017-02-15T10:21:51.728004Z</value>
        </time>
        <waveformID networkCode="US" stationCode="MNTX" locationCode="00" channelCode="BH2"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,4.0,8)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.749507Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.74955.10403">
        <time>
          <value>2017-02-15T10:21:17.206523Z</value>
        </time>
        <waveformID networkCode="US" stationCode="MNTX" locationCode="00" channelCode="BHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,4.0,8)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.749625Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.7498.10405">
        <time>
          <value>2017-02-15T10:21:22.144302Z</value>
        </time>
        <waveformID networkCode="IM" stationCode="TX31" channelCode="BHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,4.0,8)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.749876Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.749913.10406">
        <time>
          <value>2017-02-15T10:22:01.115211Z</value>
        </time>
        <waveformID networkCode="IM" stationCode="TX31" channelCode="BHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,4.0,8)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.749986Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.750028.10407">
        <time>
          <value>2017-02-15T10:21:21.748615Z</value>
        </time>
        <waveformID networkCode="IM" stationCode="TX32" channelCode="BHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,4.0,8)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.750103Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220213927.75014.10408">
        <time>
          <value>2017-02-15T10:22:00.834960Z</value>
        </time>
        <waveformID networkCode="IM" stationCode="TX32" channelCode="BHE"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,4.0,8)</filterID>
        <phaseHint>S</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:39:27.750243Z</creationTime>
        </creationInfo>
      </pick>
      <pick publicID="smi:org.gfz-potsdam.de/geofon/Pick#20170220214140.06337.10480">
        <time>
          <value>2017-02-15T10:20:57.045251Z</value>
        </time>
        <waveformID networkCode="TX" stationCode="PECS" locationCode="00" channelCode="HHZ"></waveformID>
        <filterID>smi:org.gfz-potsdam.de/geofon/BW(3,4.0,8)</filterID>
        <phaseHint>P</phaseHint>
        <evaluationMode>manual</evaluationMode>
        <creationInfo>
          <agencyID>TXNet</agencyID>
          <author>seiscomp@sc3primary.beg.utexas.edu</author>
          <creationTime>2017-02-20T21:41:40.063567Z</creationTime>
        </creationInfo>
      </pick>
    </event>
  </eventParameters>
</q:quakeml>
