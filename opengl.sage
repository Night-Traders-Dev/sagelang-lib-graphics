# lib/opengl.sage - OpenGL backend for SageLang GPU engine
#
# Provides the same high-level API as gpu.sage/vulkan.sage but using
# the OpenGL graphics backend. Games can switch between Vulkan and OpenGL
# by changing which library they import.
#
# Usage:
#   import gpu
#   import opengl
#   opengl.init_windowed("My Game", 1280, 720)  # Uses OpenGL
#   # ... rest of the API is identical to gpu module

import gpu

# ============================================================================
# OpenGL Backend Selection
# ============================================================================

proc init_windowed(title, width, height):
    # Initialize with OpenGL backend instead of Vulkan
    return gpu.init_opengl_windowed(title, width, height, 4, 5)

proc init(app_name):
    return gpu.init_opengl(app_name, 4, 5)

proc init_with_version(app_name, major, minor):
    return gpu.init_opengl(app_name, major, minor)

# ============================================================================
# Re-export all GPU functions for API compatibility
# ============================================================================

proc shutdown():
    return gpu.shutdown()

proc shutdown_windowed():
    return gpu.shutdown_windowed()

proc has_opengl():
    return gpu.has_opengl()

proc has_vulkan():
    return gpu.has_vulkan()

proc device_name():
    return gpu.device_name()

proc last_error():
    return gpu.last_error()

# ============================================================================
# Buffer Operations
# ============================================================================

proc create_buffer(size, usage, mem_props):
    return gpu.create_buffer(size, usage, mem_props)

proc destroy_buffer(handle):
    return gpu.destroy_buffer(handle)

proc buffer_upload(handle, data):
    return gpu.buffer_upload(handle, data)

proc buffer_download(handle):
    return gpu.buffer_download(handle)

proc buffer_size(handle):
    return gpu.buffer_size(handle)

# ============================================================================
# Image Operations
# ============================================================================

proc create_image(w, h, format, usage, img_type):
    return gpu.create_image(w, h, format, usage, img_type)

proc destroy_image(handle):
    return gpu.destroy_image(handle)

proc image_dims(handle):
    return gpu.image_dims(handle)

# ============================================================================
# Sampler
# ============================================================================

proc create_sampler(min_filter, mag_filter, address):
    return gpu.create_sampler(min_filter, mag_filter, address)

proc destroy_sampler(handle):
    return gpu.destroy_sampler(handle)

# ============================================================================
# Shaders (OpenGL can accept GLSL directly)
# ============================================================================

proc load_shader(path, stage):
    return gpu.load_shader(path, stage)

proc load_shader_glsl(source, stage):
    return gpu.load_shader_glsl(source, stage)

proc destroy_shader(handle):
    return gpu.destroy_shader(handle)

# ============================================================================
# Descriptors
# ============================================================================

proc create_descriptor_layout(bindings):
    return gpu.create_descriptor_layout(bindings)

proc create_descriptor_pool(max_sets, type_counts):
    return gpu.create_descriptor_pool(max_sets, type_counts)

proc allocate_descriptor_set(pool, layout):
    return gpu.allocate_descriptor_set(pool, layout)

proc update_descriptor(set, binding, type, resource):
    return gpu.update_descriptor(set, binding, type, resource)

proc update_descriptor_image(set, binding, type, image, sampler):
    return gpu.update_descriptor_image(set, binding, type, image, sampler)

# ============================================================================
# Pipelines
# ============================================================================

proc create_pipeline_layout(layouts, push_size, push_stages):
    return gpu.create_pipeline_layout(layouts, push_size, push_stages)

proc create_compute_pipeline(layout, shader):
    return gpu.create_compute_pipeline(layout, shader)

proc create_graphics_pipeline(config):
    return gpu.create_graphics_pipeline(config)

proc destroy_pipeline(handle):
    return gpu.destroy_pipeline(handle)

# ============================================================================
# Render Pass & Framebuffer
# ============================================================================

proc create_render_pass(attachments, has_depth):
    return gpu.create_render_pass(attachments, has_depth)

proc destroy_render_pass(handle):
    return gpu.destroy_render_pass(handle)

proc create_framebuffer(rp, images, w, h):
    return gpu.create_framebuffer(rp, images, w, h)

proc destroy_framebuffer(handle):
    return gpu.destroy_framebuffer(handle)

proc create_depth_buffer(w, h, format):
    return gpu.create_depth_buffer(w, h, format)

# ============================================================================
# Command Buffers
# ============================================================================

proc create_command_pool(family):
    return gpu.create_command_pool(family)

proc create_command_buffer(pool):
    return gpu.create_command_buffer(pool)

proc begin_commands(cmd):
    return gpu.begin_commands(cmd)

proc end_commands(cmd):
    return gpu.end_commands(cmd)

# ============================================================================
# Drawing Commands
# ============================================================================

proc cmd_bind_graphics_pipeline(cmd, pipeline):
    return gpu.cmd_bind_graphics_pipeline(cmd, pipeline)

proc cmd_bind_compute_pipeline(cmd, pipeline):
    return gpu.cmd_bind_compute_pipeline(cmd, pipeline)

proc cmd_bind_descriptor_set(cmd, layout, set, bind_point):
    return gpu.cmd_bind_descriptor_set(cmd, layout, set, bind_point)

proc cmd_begin_render_pass(cmd, rp, fb, w, h, clear):
    return gpu.cmd_begin_render_pass(cmd, rp, fb, w, h, clear)

proc cmd_end_render_pass(cmd):
    return gpu.cmd_end_render_pass(cmd)

proc cmd_draw(cmd, verts, instances, first_vert, first_inst):
    return gpu.cmd_draw(cmd, verts, instances, first_vert, first_inst)

proc cmd_draw_indexed(cmd, indices, instances, first_idx, vert_offset, first_inst):
    return gpu.cmd_draw_indexed(cmd, indices, instances, first_idx, vert_offset, first_inst)

proc cmd_bind_vertex_buffer(cmd, buffer):
    return gpu.cmd_bind_vertex_buffer(cmd, buffer)

proc cmd_bind_index_buffer(cmd, buffer):
    return gpu.cmd_bind_index_buffer(cmd, buffer)

proc cmd_set_viewport(cmd, x, y, w, h, min_d, max_d):
    return gpu.cmd_set_viewport(cmd, x, y, w, h, min_d, max_d)

proc cmd_set_scissor(cmd, x, y, w, h):
    return gpu.cmd_set_scissor(cmd, x, y, w, h)

proc cmd_dispatch(cmd, gx, gy, gz):
    return gpu.cmd_dispatch(cmd, gx, gy, gz)

proc cmd_push_constants(cmd, layout, stages, data):
    return gpu.cmd_push_constants(cmd, layout, stages, data)

proc cmd_pipeline_barrier(cmd, src_stage, dst_stage, src_access, dst_access):
    return gpu.cmd_pipeline_barrier(cmd, src_stage, dst_stage, src_access, dst_access)

proc cmd_copy_buffer(cmd, src, dst, size):
    return gpu.cmd_copy_buffer(cmd, src, dst, size)

# ============================================================================
# Synchronization
# ============================================================================

proc create_fence(signaled):
    return gpu.create_fence(signaled)

proc wait_fence(fence, timeout):
    return gpu.wait_fence(fence, timeout)

proc reset_fence(fence):
    return gpu.reset_fence(fence)

proc destroy_fence(fence):
    return gpu.destroy_fence(fence)

proc create_semaphore():
    return gpu.create_semaphore()

proc destroy_semaphore(sem):
    return gpu.destroy_semaphore(sem)

proc submit(cmd, fence):
    return gpu.submit(cmd, fence)

proc submit_with_sync(cmd, wait_sem, signal_sem, fence):
    return gpu.submit_with_sync(cmd, wait_sem, signal_sem, fence)

proc queue_wait_idle():
    return gpu.queue_wait_idle()

proc device_wait_idle():
    return gpu.device_wait_idle()

# ============================================================================
# Window & Swapchain
# ============================================================================

proc window_should_close():
    return gpu.window_should_close()

proc poll_events():
    return gpu.poll_events()

proc swapchain_image_count():
    return gpu.swapchain_image_count()

proc swapchain_format():
    return gpu.swapchain_format()

proc swapchain_extent():
    return gpu.swapchain_extent()

proc acquire_next_image(sem):
    return gpu.acquire_next_image(sem)

proc present(sem, image_idx):
    return gpu.present(sem, image_idx)

proc create_swapchain_framebuffers(rp):
    return gpu.create_swapchain_framebuffers(rp)

proc create_swapchain_framebuffers_depth(rp, depth):
    return gpu.create_swapchain_framebuffers_depth(rp, depth)

proc recreate_swapchain():
    return gpu.recreate_swapchain()

# ============================================================================
# Input
# ============================================================================

proc key_pressed(key):
    return gpu.key_pressed(key)

proc key_down(key):
    return gpu.key_down(key)

proc key_just_pressed(key):
    return gpu.key_just_pressed(key)

proc key_just_released(key):
    return gpu.key_just_released(key)

proc mouse_pos():
    return gpu.mouse_pos()

proc mouse_button(button):
    return gpu.mouse_button(button)

proc mouse_delta():
    return gpu.mouse_delta()

proc scroll_delta():
    return gpu.scroll_delta()

proc set_cursor_mode(mode):
    return gpu.set_cursor_mode(mode)

proc get_time():
    return gpu.get_time()

proc window_size():
    return gpu.window_size()

proc set_title(title):
    return gpu.set_title(title)

proc update_input():
    return gpu.update_input()

# ============================================================================
# Texture & Upload
# ============================================================================

proc load_texture(path, gen_mipmaps, filter, address):
    return gpu.load_texture(path, gen_mipmaps, filter, address)

proc texture_dims(handle):
    return gpu.texture_dims(handle)

proc upload_device_local(data, usage):
    return gpu.upload_device_local(data, usage)

proc create_uniform_buffer(size):
    return gpu.create_uniform_buffer(size)

proc update_uniform(handle, data):
    return gpu.update_uniform(handle, data)

# ============================================================================
# Constants (re-exported from gpu module)
# ============================================================================

# All constants from gpu module are available via gpu.CONSTANT_NAME
# or you can use them directly after import:
#   let BUFFER_VERTEX = gpu.BUFFER_VERTEX
