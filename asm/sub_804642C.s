	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set InitUnits, 0x0801756C + 1
	.set sub_801759C, 0x0801759C + 1
	.set sub_8018FEC, 0x08018FEC + 1
	.set sub_80463F4, 0x080463F4 + 1
	.set sub_80AA1AC, 0x080AA1AC + 1
	.set sub_80AB0D8, 0x080AB0D8 + 1
	.section .text.sub_804642C, "ax", %progbits
@ sub_804642C @ JP 0x0804642C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804642C
	.thumb_func
sub_804642C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	ldr r0, _080464E8 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #6
	adds r0, #1
	mov r8, r0
	ldr r1, _080464EC @ =0x0203DD24
	movs r0, #0
	str r0, [r1]
	bl InitUnits
	ldr r0, _080464F0 @ =0x0203DA20
	ldrb r0, [r0, #3]
	ldr r4, _080464F4 @ =0x085D378C
	ldr r1, [r4]
	bl sub_80AB0D8
	movs r6, #0
	ldr r0, _080464F8 @ =0x0203DDB0
	mov sl, r0
	movs r7, #0x10
_08046466:
	mov r1, r8
	adds r4, r1, r6
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	bl sub_801759C
	ldr r1, _080464F4 @ =0x085D378C
	ldr r0, [r1]
	adds r0, r0, r7
	adds r1, r5, #0
	bl sub_80AA1AC
	adds r0, r5, #0
	bl sub_80463F4
	strb r4, [r5, #0xb]
	cmp r6, #0
	bne _080464A4
	adds r0, r5, #0
	bl sub_8018FEC
	ldr r1, _080464E8 @ =0x085D31E8
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	add r1, sl
	strh r0, [r1]
_080464A4:
	adds r7, #0x24
	adds r6, #1
	cmp r6, #4
	ble _08046466
	ldr r2, _080464E8 @ =0x085D31E8
	mov r3, sb
	adds r3, #0x64
	mov r4, sb
	adds r4, #0x4c
	ldr r0, _080464F0 @ =0x0203DA20
	movs r1, #0
	movs r6, #3
	adds r0, #0x9f
_080464BE:
	strb r1, [r0]
	subs r0, #1
	subs r6, #1
	cmp r6, #0
	bge _080464BE
	ldr r2, [r2]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	movs r1, #0
	strb r0, [r2, #0xa]
	strh r1, [r3]
	strh r1, [r4]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080464E8: .4byte 0x085D31E8
_080464EC: .4byte 0x0203DD24
_080464F0: .4byte 0x0203DA20
_080464F4: .4byte 0x085D378C
_080464F8: .4byte 0x0203DDB0

