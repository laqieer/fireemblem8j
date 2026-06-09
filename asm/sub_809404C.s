	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80034D0, 0x080034D0 + 1
	.set sub_8092518, 0x08092518 + 1
	.set sub_80944C4, 0x080944C4 + 1
	.set sub_8094590, 0x08094590 + 1
	.set sub_80945E8, 0x080945E8 + 1
	.section .text.sub_809404C, "ax", %progbits
@ sub_809404C @ JP 0x0809404C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809404C
	.thumb_func
sub_809404C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x38
	ldr r1, _080940AC @ =0x08A9387C
	ldrh r0, [r5, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _08094078
	movs r0, #0x14
	strb r0, [r2]
_08094078:
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	movs r3, #0
	str r2, [sp, #0xc]
	adds r2, r5, #0
	adds r2, #0x36
	str r2, [sp, #8]
	movs r0, #0x2f
	adds r0, r0, r5
	mov sl, r0
	ldr r1, [sp, #0xc]
	str r1, [sp, #4]
_08094092:
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	mov r1, sl
	ldrb r1, [r1]
	cmp r0, r1
	bls _080940B0
	ldr r2, [sp, #4]
	ldrb r0, [r2]
	adds r0, r3, r0
	cmp r0, #0x14
	bgt _080940B8
	b _080940BE
	.align 2, 0
_080940AC: .4byte 0x08A9387C
_080940B0:
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	cmp r3, r0
	bge _080940BC
_080940B8:
	movs r1, #0
	b _080940C4
_080940BC:
	subs r0, r3, r0
_080940BE:
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_080940C4:
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #3
	adds r0, r4, #0
	adds r0, #0xc
	lsls r6, r1, #1
	adds r2, r3, #1
	mov sb, r2
	cmp r4, r0
	bge _08094108
	movs r0, #0x1f
	mov r8, r0
	ldr r1, _08094184 @ =0x02022CA8
	mov ip, r1
	ldr r7, _08094188 @ =0x0200D7E0
	adds r2, r6, #0
_080940E2:
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	lsls r1, r0, #5
	adds r1, #8
	adds r1, r1, r3
	lsls r1, r1, #1
	add r1, ip
	lsls r0, r0, #6
	adds r0, r2, r0
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #3
	adds r0, #0xc
	cmp r4, r0
	blt _080940E2
_08094108:
	ldr r0, _0809418C @ =0x02023CA8
	ldr r1, _08094190 @ =0x0200DFE0
	adds r2, r6, r1
	adds r1, r3, #0
	adds r1, #0xa8
	movs r4, #1
	lsls r1, r1, #1
	adds r1, r1, r0
_08094118:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #0x40
	adds r1, #0x40
	subs r4, #1
	cmp r4, #0
	bge _08094118
	mov r3, sb
	cmp r3, #0x13
	ble _08094092
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	cmp r0, #0x13
	bls _080941EC
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	mov r2, sl
	strb r0, [r2]
	ldr r0, _08094194 @ =0x02023DF8
	movs r1, #0x16
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _08094198 @ =0x02022CB8
	movs r1, #0x16
	movs r2, #0x1f
	movs r3, #0
	bl j_TmFillRect
	adds r4, r5, #0
	adds r4, #0x32
	adds r6, r5, #0
	adds r6, #0x2e
	ldr r1, _0809419C @ =0x0200F15C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
_0809416A:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _0809416A
	bl sub_80034D0
	ldrb r0, [r4]
	bl sub_8092518
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _080941BC
	.align 2, 0
_08094184: .4byte 0x02022CA8
_08094188: .4byte 0x0200D7E0
_0809418C: .4byte 0x02023CA8
_08094190: .4byte 0x0200DFE0
_08094194: .4byte 0x02023DF8
_08094198: .4byte 0x02022CB8
_0809419C: .4byte 0x0200F15C
_080941A0:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r0, sl
	ldrb r3, [r0]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _080941FC @ =0x0200D7E0
	bl sub_80945E8
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
_080941BC:
	cmp r4, r0
	bge _080941C8
	ldr r0, _08094200 @ =0x0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt _080941A0
_080941C8:
	ldr r0, _08094204 @ =0x0200DFE0
	mov r2, sl
	ldrb r1, [r2]
	bl sub_80944C4
	ldrb r0, [r6]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #0
	bl sub_8094590
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	bl sub_8002DE4
_080941EC:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080941FC: .4byte 0x0200D7E0
_08094200: .4byte 0x0200F158
_08094204: .4byte 0x0200DFE0

