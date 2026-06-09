	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set PutText, 0x08003DA0 + 1
	.set __modsi3, 0x080D6690 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8008E10, 0x08008E10 + 1
	.section .text.sub_8007ED8, "ax", %progbits
@ sub_8007ED8 @ JP 0x08007ED8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007ED8
	.thumb_func
sub_8007ED8:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	ble _08007FB8
	ldr r4, _08007FC0 @ =0x085B90D4
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	ldr r1, [r4]
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r5, #0
	ldr r0, [r4]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	bge _08007F56
	adds r6, r4, #0
_08007F22:
	ldr r4, [r6]
	ldrb r0, [r4, #0xb]
	adds r0, r5, r0
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08007FC4 @ =0x030000C8
	adds r0, r0, r1
	lsls r1, r5, #1
	ldrb r2, [r4, #0xd]
	adds r1, r1, r2
	lsls r1, r1, #5
	ldrb r4, [r4, #0xc]
	adds r1, r1, r4
	lsls r1, r1, #1
	ldr r2, _08007FC8 @ =0x02022CA8
	adds r1, r1, r2
	bl PutText
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	blt _08007F22
_08007F56:
	ldr r4, _08007FC0 @ =0x085B90D4
	ldr r2, [r4]
	ldrb r0, [r2, #0xa]
	subs r0, #1
	lsls r0, r0, #1
	ldrb r1, [r2, #0xd]
	adds r0, r0, r1
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08007FC8 @ =0x02022CA8
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	movs r2, #2
	movs r3, #0
	bl j_TmFillRect
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	ldrb r0, [r0, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	ldr r5, _08007FC4 @ =0x030000C8
	adds r0, r0, r5
	bl sub_8003CF8
	ldr r4, [r4]
	ldrb r1, [r4, #0xa]
	ldrb r0, [r4, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4, #8]
	bl sub_8003D90
	movs r0, #1
	bl sub_8008E10
	adds r0, r7, #0
	bl sub_8002DE4
_08007FB8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007FC0: .4byte 0x085B90D4
_08007FC4: .4byte 0x030000C8
_08007FC8: .4byte 0x02022CA8

