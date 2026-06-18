	.syntax unified
	.section .text.sub_80C0574, "ax", %progbits
@ GmapScreen2_GetNodeScreenPos @ JP 0x080C0574 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GmapScreen2_GetNodeScreenPos
	.thumb_func
GmapScreen2_GetNodeScreenPos:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r3, #0
	ldr r5, [sp, #0x14]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r4, sp
	ldrh r3, [r0, #0x34]
	strh r3, [r4]
	mov r3, sp
	adds r3, #2
	ldrh r4, [r0, #0x36]
	strh r4, [r3]
	mov r0, sp
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r6]
	subs r2, r2, r4
	strh r2, [r5]
	adds r2, #0x20
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, #0xdf
	bhi _080C05BC
	ldrh r0, [r6]
	adds r0, #0x20
	lsls r0, r0, #0x10
	ldr r1, _080C05B8 @ =0x012F0000
	cmp r0, r1
	bhi _080C05BC
	movs r0, #1
	b _080C05BE
	.align 2, 0
_080C05B8: .4byte 0x012F0000
_080C05BC:
	movs r0, #0
_080C05BE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

