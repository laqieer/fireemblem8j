	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80AF64C, "ax", %progbits
@ sub_80AF64C @ JP 0x080AF64C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AF64C
	.thumb_func
sub_80AF64C:
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x10
	cmp r0, #0
	beq _080AF678
	ldr r2, _080AF674 @ =0x020228A8
	lsrs r0, r1, #0x12
	movs r1, #0xf
	ands r0, r1
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0xb4
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	b _080AF686
	.align 2, 0
_080AF674: .4byte 0x020228A8
_080AF678:
	ldr r0, _080AF690 @ =0x020228A8
	ldr r2, _080AF694 @ =0x0000033A
	adds r1, r0, r2
	ldrh r1, [r1]
	subs r2, #0x6a
	adds r0, r0, r2
	strh r1, [r0]
_080AF686:
	bl sub_8001EE4
	pop {r0}
	bx r0
	.align 2, 0
_080AF690: .4byte 0x020228A8
_080AF694: .4byte 0x0000033A

