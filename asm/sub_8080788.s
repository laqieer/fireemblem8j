	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80844CC, 0x080844CC + 1
	.section .text.sub_8080788, "ax", %progbits
@ sub_8080788 @ JP 0x08080788 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080788
	.thumb_func
sub_8080788:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _080807A6
	adds r0, r1, #1
	strh r0, [r4]
	adds r0, r5, #0
	bl sub_8002DE4
_080807A6:
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	ldrh r2, [r4]
	subs r2, #1
	strh r2, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, _080807C8 @ =0x08A14484
	str r3, [sp]
	movs r3, #0xc
	bl sub_80844CC
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080807C8: .4byte 0x08A14484

