<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0"><?= $menu ?></h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item active"></li>
          </ol>
        </div>
      </div>
    </div>
  </div>
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <section class="col-lg-12 connectedSortable">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">
                <i class="fas fa-chart-pie mr-1"></i>
                Sales
              </h3>
              <div class="card-tools">
                <ul class="nav nav-pills ml-auto">
                  <li class="nav-item">
                    <a class="nav-link active" href="#revenue-chart" data-toggle="tab">Area</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#sales-chart" data-toggle="tab">Donut</a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="card-body">
              <div class="tab-content p-0">
                <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;">
                  <div><?php $action = custom(); echo $this->session->flashdata("simpan");?>
                    <div class="row">
                      <div class="col-lg-1 col-sm-3">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default">
                          <i class="fas fa-plus"></i> <?= $action->action[0] ?>
                        </button>
                      </div>
                    </div>
                    <?php
                    print_r($table);
                    ?>
                    <div class="modal fade" id="modal-default">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h4 class="modal-title">Default Modal</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <form action="<?= base_url() ?>beranda/beranda/simpan" method="post">
                            <div class="modal-body">
                              <?php
                              foreach ($field as $key => $value) {
                                if($value!='id'){
                              ?>
                                <div class="form-group">
                                  <div class="input-group">
                                    <div class="input-group-prepend">
                                      <span class="input-group-text"><?=$value?></span>
                                    </div>
                                    <input type="text" name="<?=$value?>" class="form-control">
                                  </div>
                                </div>
                              <?php
                                }
                              }
                              ?>
                            </div>
                            <div class="modal-footer justify-content-between">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              <input type="submit" class="btn btn-primary" value="Save">
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;">
                  <div>Donut</div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
  </section>
</div>