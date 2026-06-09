	.syntax unified
	.section .text.sub_80019F8, "ax", %progbits
@ sub_80019F8 @ JP 0x080019F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80019F8
	.thumb_func
sub_80019F8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0x1f
_08001A04:
	ldr r0, _08001ABC @ =0x02022288
	adds r2, r1, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r3, r1, #1
	mov sb, r3
	cmp r0, #0
	beq _08001AA0
	movs r7, #0xf
	lsls r1, r1, #4
	mov r8, r1
	ldr r4, _08001AC0 @ =0x020228A8
	mov sl, r4
	ldr r0, _08001AC4 @ =0x020222A8
	mov ip, r0
	adds r5, r2, #0
_08001A24:
	mov r3, r8
	adds r1, r3, r7
	lsls r6, r1, #1
	adds r1, r6, r1
	mov r4, ip
	adds r2, r1, r4
	ldrb r0, [r5]
	ldrb r3, [r2]
	adds r0, r0, r3
	strb r0, [r2]
	adds r0, r1, #1
	adds r4, r0, r4
	ldrb r0, [r5]
	ldrb r3, [r4]
	adds r0, r0, r3
	strb r0, [r4]
	adds r1, #2
	add r1, ip
	ldrb r0, [r5]
	ldrb r3, [r1]
	adds r0, r0, r3
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r3, r0, #0
	subs r3, #0x20
	cmp r3, #0x1f
	ble _08001A5E
	movs r3, #0x1f
_08001A5E:
	cmp r3, #0
	bge _08001A64
	movs r3, #0
_08001A64:
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r2, r0, #0
	subs r2, #0x20
	cmp r2, #0x1f
	ble _08001A72
	movs r2, #0x1f
_08001A72:
	cmp r2, #0
	bge _08001A78
	movs r2, #0
_08001A78:
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	subs r1, #0x20
	cmp r1, #0x1f
	ble _08001A86
	movs r1, #0x1f
_08001A86:
	cmp r1, #0
	bge _08001A8C
	movs r1, #0
_08001A8C:
	mov r4, sl
	adds r0, r6, r4
	lsls r1, r1, #0xa
	lsls r2, r2, #5
	adds r1, r1, r2
	adds r1, r3, r1
	strh r1, [r0]
	subs r7, #1
	cmp r7, #0
	bge _08001A24
_08001AA0:
	mov r1, sb
	cmp r1, #0
	bge _08001A04
	movs r0, #1
	ldr r1, _08001AC8 @ =0x0300000D
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001ABC: .4byte 0x02022288
_08001AC0: .4byte 0x020228A8
_08001AC4: .4byte 0x020222A8
_08001AC8: .4byte 0x0300000D

