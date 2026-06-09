	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80B2730, 0x080B2730 + 1
	.section .text.sub_80B261C, "ax", %progbits
@ sub_80B261C @ JP 0x080B261C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B261C
	.thumb_func
sub_80B261C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x1c]
	ldr r7, [sp, #0x20]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	bl sub_80B2730
	ldr r0, _080B268C @ =0x08A9DCD4
	adds r1, r7, #0
	bl sub_8002BCC
	adds r7, r0, #0
	ldr r0, _080B2690 @ =0x08A97B70
	ldr r2, _080B2694 @ =0x06010000
	adds r1, r4, r2
	bl sub_8013008
	ldr r0, _080B2698 @ =0x08A97BEC
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	lsls r4, r4, #0xf
	lsrs r4, r4, #0x14
	movs r0, #0xf
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #0xc
	adds r4, r4, r0
	adds r5, r5, r4
	adds r0, r7, #0
	adds r0, #0x4c
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	mov r2, sb
	strb r2, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B268C: .4byte 0x08A9DCD4
_080B2690: .4byte 0x08A97B70
_080B2694: .4byte 0x06010000
_080B2698: .4byte 0x08A97BEC

