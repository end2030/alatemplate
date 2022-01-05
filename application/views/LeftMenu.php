<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="index3.html" class="brand-link">
        <img src="<?= base_url() ?>/src/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light"><?="User Level"?></span>
    </a>
    <?php
    $obj  = custom ();
    ?>
    <div class="sidebar">
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-header">Dashboard</li>
                <?php
                foreach ($obj->menu as $key => $value) {
                ?>
                    <li class="nav-item">
                        <a href="<?= base_url($value."/".$value) ?>" class="nav-link">
                            <i class="nav-icon fa fa-bullseye"></i>
                            <p><?= $value ?></p>
                        </a>
                    </li>
                <?php
                }
                foreach ($obj->menusub as $key => $value) {
                ?>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-plus-square"></i>
                            <p><?= $value->menu ?><i class="fas fa-angle-left right"></i></p>
                        </a>
                        <ul class="nav nav-treeview">
                            <?php
                            foreach ($value->sub as $key => $subs) {
                            ?>
                                <li class="nav-item"><a href="pages/examples/login.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p><?= $subs ?></p>
                                    </a>
                                </li>
                            <?php
                            }
                            ?>
                        </ul>
                    </li>
                <?php
                }
                ?>
            </ul>
        </nav>
    </div>
</aside>
