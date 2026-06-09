	.syntax unified
	.set sub_8089088, 0x08089088 + 1
	.set sub_8097674, 0x08097674 + 1
	.section .text.sub_80926F8, "ax", %progbits
@ sub_80926F8 @ JP 0x080926F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80926F8
	.thumb_func
sub_80926F8:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	asrs r7, r1, #0x18
	cmp r7, #0
	beq _0809273A
	bl sub_8097674
	b _0809273E
_08092710:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r3, [r4, #0x3e]
	b _080927E0
_0809271A:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r1, [r4, #0x3e]
	b _080927E0
_08092724:
	subs r1, r3, r1
	adds r0, r4, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _080927E0
_0809272E:
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #1
	strb r0, [r1]
	strh r6, [r4, #0x3e]
	b _080927E0
_0809273A:
	bl sub_8089088
_0809273E:
	adds r2, r0, #0
	movs r3, #0
	ldr r0, _08092770 @ =0x0200F158
	ldrb r1, [r0]
	mov sb, r0
	cmp r3, r1
	bge _080927E0
	movs r0, #0x2c
	adds r0, r0, r4
	mov ip, r0
	mov r8, r1
	movs r5, #0x40
	rsbs r5, r5, #0
	movs r6, #0x10
	rsbs r6, r6, #0
	ldr r1, _08092774 @ =0x0200D6E0
_0809275E:
	cmp r7, #0
	beq _08092778
	ldr r0, [r1]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r2
	beq _08092786
	b _080927D4
	.align 2, 0
_08092770: .4byte 0x0200F158
_08092774: .4byte 0x0200D6E0
_08092778:
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r2
	bne _080927D4
_08092786:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r3, [r0]
	cmp r3, #0
	beq _08092710
	mov r0, sb
	ldrb r2, [r0]
	subs r0, r2, #1
	cmp r3, r0
	bne _080927B2
	cmp r2, #6
	bls _0809271A
	movs r0, #5
	mov r1, ip
	strb r0, [r1]
	mov r1, sb
	ldrb r0, [r1]
	subs r0, #6
	lsls r0, r0, #4
	strh r0, [r4, #0x3e]
	b _080927E0
_080927B2:
	ldrh r2, [r4, #0x3e]
	lsrs r1, r2, #4
	adds r0, r1, #0
	cmp r3, r0
	ble _080927C2
	adds r0, #5
	cmp r3, r0
	blt _08092724
_080927C2:
	cmp r2, r6
	bgt _0809272E
	cmp r2, r5
	bge _080927E0
	movs r0, #4
	mov r1, ip
	strb r0, [r1]
	strh r5, [r4, #0x3e]
	b _080927E0
_080927D4:
	adds r5, #0x10
	adds r6, #0x10
	adds r1, #4
	adds r3, #1
	cmp r3, r8
	blt _0809275E
_080927E0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

