	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80C7864, "ax", %progbits
@ sub_80C7864 @ JP 0x080C7864 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7864
	.thumb_func
sub_80C7864:
	push {lr}
	adds r2, r0, #0
	lsls r2, r2, #0xc
	ldr r0, _080C7884 @ =0x06010000
	adds r2, r2, r0
	ldr r3, _080C7888 @ =0x081F67BC
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r1, r2, #0
	bl sub_8013008
	pop {r0}
	bx r0
	.align 2, 0
_080C7884: .4byte 0x06010000
_080C7888: .4byte 0x081F67BC

