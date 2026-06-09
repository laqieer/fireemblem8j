	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetFacePosition, 0x0800651C + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80A3DC8, 0x080A3DC8 + 1
	.section .text.sub_80A3E24, "ax", %progbits
@ sub_80A3E24 @ JP 0x080A3E24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3E24
	.thumb_func
sub_80A3E24:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r3, #0x10
	subs r3, r3, r0
	adds r0, r6, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r5, #0
	muls r1, r0, r1
	mov r8, r1
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r7, r5, #0
	muls r7, r0, r7
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	mov r0, r8
	lsls r5, r0, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r7, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl BG_SetPosition
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl BG_SetPosition
	movs r0, #2
	adds r1, r5, #0
	adds r2, r4, #0
	bl BG_SetPosition
	mov r1, r8
	rsbs r0, r1, #0
	adds r1, r6, #0
	adds r1, #0x52
	strh r0, [r1]
	rsbs r1, r7, #0
	adds r2, r6, #0
	adds r2, #0x54
	strh r1, [r2]
	bl sub_80A3DC8
	adds r0, r6, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A3EE0
	movs r1, #0xd8
	mov r0, r8
	subs r1, r1, r0
	movs r2, #0x58
	subs r2, r2, r7
	movs r0, #0
	bl SetFacePosition
_080A3EE0:
	ldr r0, [r6, #0x2c]
	cmp r0, #0xa
	bne _080A3EEC
	adds r0, r6, #0
	bl sub_8002DE4
_080A3EEC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

