# 處理偏振相機數據使用程式

- get100mean_main.m <br />
    負責讀取一個裝有各種角度的資料夾，並逐個角度呼叫get100mean來計算各個角度的相位並統整

- get100mean.m <br/>
    讀取單個角度資料夾內所有圖片加總並計算中心100*100平均，並且呈現計算出的相位

- Polarizer.m 和 Retarder.m <br/>
    分別表示偏振片和相位延遲片(波片)的Jone Matrix

- light_sim.m 和 light_sim_3d.m <br/>
    波片角度和相位差的理論模擬<br/>
    3d版本則是波片角度和波片延遲量和相位差的理論模擬