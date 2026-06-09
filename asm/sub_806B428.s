	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_806B428, "ax", %progbits
@ sub_806B428 @ JP 0x0806B428 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806B428
	.thumb_func
sub_806B428:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r0, [r7, #0x44]
	subs r0, #1
	cmp r0, #4
	bls _0806B44C
	b _0806B568
_0806B44C:
	lsls r0, r0, #2
	ldr r1, _0806B458 @ =_0806B45C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B458: .4byte _0806B45C
_0806B45C: @ jump table
	.4byte _0806B470 @ case 0
	.4byte _0806B48C @ case 1
	.4byte _0806B4C0 @ case 2
	.4byte _0806B4F4 @ case 3
	.4byte _0806B528 @ case 4
_0806B470:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _0806B4B4
	cmp r0, #1
	beq _0806B47E
	b _0806B56E
_0806B47E:
	ldr r0, _0806B488 @ =efxDarkGradoBG01_OnHBlank_13
	bl SetPrimaryHBlankHandler
	b _0806B56E
	.align 2, 0
_0806B488: .4byte 0x0806B101  @ efxDarkGradoBG01_OnHBlank_13
_0806B48C:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #1
	beq _0806B4B4
	cmp r0, #1
	bgt _0806B49E
	cmp r0, #0
	beq _0806B4DC
	b _0806B56E
_0806B49E:
	cmp r0, #2
	beq _0806B544
	cmp r0, #3
	bne _0806B56E
	ldr r0, _0806B4B0 @ =efxDarkGradoBG01_OnHBlank_7
	bl SetPrimaryHBlankHandler
	b _0806B56E
	.align 2, 0
_0806B4B0: .4byte 0x0806B269  @ efxDarkGradoBG01_OnHBlank_7
_0806B4B4:
	ldr r0, _0806B4BC @ =efxDarkGradoBG01_OnHBlank_10
	bl SetPrimaryHBlankHandler
	b _0806B56E
	.align 2, 0
_0806B4BC: .4byte 0x0806B1B5  @ efxDarkGradoBG01_OnHBlank_10
_0806B4C0:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #1
	beq _0806B4DC
	cmp r0, #1
	bgt _0806B4D2
	cmp r0, #0
	beq _0806B4E8
	b _0806B56E
_0806B4D2:
	cmp r0, #2
	beq _0806B544
	cmp r0, #3
	bne _0806B56E
	b _0806B4E8
_0806B4DC:
	ldr r0, _0806B4E4 @ =efxDarkGradoBG01_OnHBlank_8
	bl SetPrimaryHBlankHandler
	b _0806B56E
	.align 2, 0
_0806B4E4: .4byte 0x0806B22D  @ efxDarkGradoBG01_OnHBlank_8
_0806B4E8:
	ldr r0, _0806B4F0 @ =efxDarkGradoBG01_OnHBlank_6
	bl SetPrimaryHBlankHandler
	b _0806B56E
	.align 2, 0
_0806B4F0: .4byte 0x0806B2A5  @ efxDarkGradoBG01_OnHBlank_6
_0806B4F4:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #1
	beq _0806B510
	cmp r0, #1
	bgt _0806B506
	cmp r0, #0
	beq _0806B51C
	b _0806B56E
_0806B506:
	cmp r0, #2
	beq _0806B544
	cmp r0, #3
	bne _0806B56E
	b _0806B51C
_0806B510:
	ldr r0, _0806B518 @ =efxDarkGradoBG01_OnHBlank_5
	bl SetPrimaryHBlankHandler
	b _0806B56E
	.align 2, 0
_0806B518: .4byte 0x0806B2E1  @ efxDarkGradoBG01_OnHBlank_5
_0806B51C:
	ldr r0, _0806B524 @ =efxDarkGradoBG01_OnHBlank_4
	bl SetPrimaryHBlankHandler
	b _0806B56E
	.align 2, 0
_0806B524: .4byte 0x0806B31D  @ efxDarkGradoBG01_OnHBlank_4
_0806B528:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #1
	beq _0806B550
	cmp r0, #1
	bgt _0806B53A
	cmp r0, #0
	beq _0806B55C
	b _0806B56E
_0806B53A:
	cmp r0, #2
	beq _0806B544
	cmp r0, #3
	bne _0806B56E
	b _0806B550
_0806B544:
	ldr r0, _0806B54C @ =efxDarkGradoBG01_OnHBlank_0
	bl SetPrimaryHBlankHandler
	b _0806B56E
	.align 2, 0
_0806B54C: .4byte 0x0806B40D  @ efxDarkGradoBG01_OnHBlank_0
_0806B550:
	ldr r0, _0806B558 @ =efxDarkGradoBG01_OnHBlank_3
	bl SetPrimaryHBlankHandler
	b _0806B56E
	.align 2, 0
_0806B558: .4byte 0x0806B359  @ efxDarkGradoBG01_OnHBlank_3
_0806B55C:
	ldr r0, _0806B564 @ =efxDarkGradoBG01_OnHBlank_2
	bl SetPrimaryHBlankHandler
	b _0806B56E
	.align 2, 0
_0806B564: .4byte 0x0806B395  @ efxDarkGradoBG01_OnHBlank_2
_0806B568:
	ldr r0, _0806B5A0 @ =efxDarkGradoBG01_OnHBlank_0
	bl SetPrimaryHBlankHandler
_0806B56E:
	mov r0, r8
	cmp r0, #0
	blt _0806B5A4
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	mov r1, r8
	lsls r4, r1, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl sub_805660C
	mov r0, r8
	strh r0, [r7, #0x2e]
	b _0806B5C8
	.align 2, 0
_0806B5A0: .4byte 0x0806B40D  @ efxDarkGradoBG01_OnHBlank_0
_0806B5A4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	bne _0806B5C8
	bl sub_8056130
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r1, _0806B5D4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r7, #0
	bl sub_8002DE4
_0806B5C8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B5D4: .4byte 0x0201774C

