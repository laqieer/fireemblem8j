	.syntax unified
	.section .text.sub_80A93E8, "ax", %progbits
@ sub_80A93E8 @ JP 0x080A93E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A93E8
	.thumb_func
sub_80A93E8:
	push {lr}
	movs r3, #0
	ldr r2, _080A9408 @ =0x0203E890
	movs r1, #0x45
_080A93F0:
	ldr r0, [r2, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A93F0
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_080A9408: .4byte 0x0203E890

