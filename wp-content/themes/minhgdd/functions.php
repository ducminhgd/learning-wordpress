<?php

defined('THEME_URL', get_stylesheet_directory());

/**
 *  Setup theme
 */
if (!function_exists('minhgdd_theme_setup')) {
    function minhgdd_theme_setup() {
        add_theme_support( 'automatic-feed-links' );
        add_theme_support( 'post-thumbnails' );
        add_theme_support( 'title-tag' );
        add_theme_support( 'post-formats',
            array(
                'image',
                'video',
                'gallery',
                'quote',
                'link'
            )
        );
        register_nav_menu ( 'primary-menu', __('Primary Menu', 'minhgdd') );
        
        $sidebar = array(
            'name' => __('Main Sidebar', 'minhgdd'),
            'id' => 'main-sidebar',
            'description' => 'Main sidebar for MinhGDD theme',
            'class' => 'main-sidebar',
            'before_title' => '<h3 class="widgettitle">',
            'after_title' => '</h3>'
        );
        register_sidebar( $sidebar );
    }
    add_action('init', 'minhgdd_theme_setup');
}


if ( ! function_exists( 'minhgdd_logo' ) ) {
    function minhgdd_logo() {?>
        <div class="logo">
    
        <div class="site-name">
            <?php if ( is_home() ) {
            printf(
                '<h1><a href="%1$s" title="%2$s">%3$s</a></h1>',
                get_bloginfo( 'url' ),
                get_bloginfo( 'description' ),
                get_bloginfo( 'sitename' )
            );
            } else {
            printf(
                '<p><a href="%1$s" title="%2$s">%3$s</a></p>',
                get_bloginfo( 'url' ),
                get_bloginfo( 'description' ),
                get_bloginfo( 'sitename' )
            );
            } // endif ?>
        </div>
        <div class="site-description"><?php bloginfo( 'description' ); ?></div>
    
        </div>
    <?php }
    }
    