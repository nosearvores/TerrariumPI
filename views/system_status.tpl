% include('inc/page_header.tpl')
        <div class="row load">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
              <div class="x_title">
                <h2><span class="title">CPU Load</span> <small>live...</small> <span class="badge bg-red" style="display:none;">warning</span></h2>
                <ul class="nav navbar-right panel_toolbox">
                  <li>
                    <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                  </li>
                  <li class="dropdown">
                    <a aria-expanded="false" class="dropdown-toggle" data-toggle="dropdown" href="#" role="button"><i class="fa fa-wrench"></i></a>
                    <ul class="dropdown-menu" role="menu">
                      <li>
                        <a href="#" onclick="menu_click('system_settings.html')">Settings</a>
                      </li>
                    </ul>
                  </li>
                  <li>
                    <a class="close-link"><i class="fa fa-close"></i></a>
                  </li>
                </ul>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <div class="col-md-3 col-sm-4 col-xs-12">
                  <div class="sidebar-widget">
                    <canvas class="gauge"></canvas>
                    <div class="goal-wrapper">
                      <span class="gauge-value pull-left">...</span> <span class="gauge-value pull-left">%</span>
                    </div>
                  </div>
                </div>
                <div class="col-md-9 col-sm-8 col-xs-12">
                  <div class="history_graph loading"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row temperature">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
              <div class="x_title">
                <h2><span class="title">CPU Temperature</span> <small>live...</small> <span class="badge bg-red" style="display:none;">warning</span></h2>
                <ul class="nav navbar-right panel_toolbox">
                  <li>
                    <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                  </li>
                  <li class="dropdown">
                    <a aria-expanded="false" class="dropdown-toggle" data-toggle="dropdown" href="#" role="button"><i class="fa fa-wrench"></i></a>
                    <ul class="dropdown-menu" role="menu">
                      <li>
                        <a href="#" onclick="menu_click('system_settings.html')">Settings</a>
                      </li>
                    </ul>
                  </li>
                  <li>
                    <a class="close-link"><i class="fa fa-close"></i></a>
                  </li>
                </ul>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <div class="col-md-3 col-sm-4 col-xs-12">
                  <div class="sidebar-widget">
                    <canvas class="gauge"></canvas>
                    <div class="goal-wrapper">
                      <span class="gauge-value pull-left">...</span> <span class="gauge-value pull-left">°C</span>
                    </div>
                  </div>
                </div>
                <div class="col-md-9 col-sm-8 col-xs-12">
                  <div class="history_graph loading"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row memory">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
              <div class="x_title">
                <h2><span class="title">Memory usage</span> <small>live...</small> <span class="badge bg-red" style="display:none;">warning</span></h2>
                <ul class="nav navbar-right panel_toolbox">
                  <li>
                    <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                  </li>
                  <li class="dropdown">
                    <a aria-expanded="false" class="dropdown-toggle" data-toggle="dropdown" href="#" role="button"><i class="fa fa-wrench"></i></a>
                    <ul class="dropdown-menu" role="menu">
                      <li>
                        <a href="#" onclick="menu_click('system_settings.html')">Settings</a>
                      </li>
                    </ul>
                  </li>
                  <li>
                    <a class="close-link"><i class="fa fa-close"></i></a>
                  </li>
                </ul>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <div class="col-md-3 col-sm-4 col-xs-12">
                  <div class="sidebar-widget">
                    <canvas class="gauge"></canvas>
                    <div class="goal-wrapper">
                      <span class="gauge-value pull-left">...</span> <span class="gauge-value pull-left">MB</span>
                    </div>
                  </div>
                </div>
                <div class="col-md-9 col-sm-8 col-xs-12">
                  <div class="history_graph loading"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row uptime">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
              <div class="x_title">
                <h2><span class="title">Uptime</span> <small class="data_update">live...</small></h2>
                <ul class="nav navbar-right panel_toolbox">
                  <li>
                    <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                  </li>
                  <li class="dropdown">
                    <a aria-expanded="false" class="dropdown-toggle" data-toggle="dropdown" href="#" role="button"><i class="fa fa-wrench"></i></a>
                    <ul class="dropdown-menu" role="menu">
                      <li>
                        <a href="#" onclick="menu_click('system_settings.html')">Settings</a>
                      </li>
                    </ul>
                  </li>
                  <li>
                    <a class="close-link"><i class="fa fa-close"></i></a>
                  </li>
                </ul>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="history_graph loading"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          $(document).ready(function() {
            $.get('/api/history/system',function(data) {
              globals.gauges = [];
              $.each(Object.keys(data.system), function (index,key){
                var row = $('div.row.' + key).attr('id','sensor_system_' + key);
                row.find('canvas').attr('id','gauge_canvas_system_' + key);
                row.find('div.goal-wrapper > span:first').attr('id','gauge_text_system_' + key);
                row.find('div.history_graph').attr('id','history_graph_system_' + key);

                gauge_data = {alarm: false, current : 0, alarm_min : 0, alarm_max: 0, min : 0, max : 0}
                switch (key) {
                  case 'load':
                    gauge_data.current = data.system[key]['load1'][data.system[key]['load1'].length-1][1] * 100;
                    gauge_data.alarm_max = 100;
                    gauge_data.max = 100;
                    break;

                  case 'temperature':
                    gauge_data.current = data.system[key][data.system[key].length-1][1];
                    gauge_data.alarm_min = 30;
                    gauge_data.alarm_max = 50;
                    gauge_data.max = 80;
                    break;

                  case 'memory':
                    gauge_data.current = data.system[key]['used'][data.system[key]['used'].length-1][1] / (1024 * 1024);
                    gauge_data.max = data.system[key]['total'][data.system[key]['total'].length-1][1] / (1024 * 1024);
                    gauge_data.alarm_max = gauge_data.max * 0.9;
                    break;
                }
                if (key != 'uptime') {
                  gauge_data.alarm = gauge_data.current < gauge_data.alarm_min || gauge_data.current > gauge_data.alarm_max
                  sensor_gauge('system_' + key, gauge_data);
                }

                history_graph('system_' + key,data.system[key],'system_' + key);
              });
            });
          });
        </script>
% include('inc/page_footer.tpl')
