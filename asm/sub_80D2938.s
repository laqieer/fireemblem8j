	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_8003D30, 0x08003D30 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.section .text.sub_80D2938, "ax", %progbits
@ ClassChgMenuOnDrawCore @ JP 0x080D2938 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClassChgMenuOnDrawCore
	.thumb_func
ClassChgMenuOnDrawCore:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, [r5, #0x30]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _080D2954
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r1, #8]
	bl sub_8003D90
_080D2954:
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	adds r4, r5, #0
	adds r4, #0x34
	cmp r0, #2
	bne _080D296A
	adds r0, r4, #0
	movs r1, #1
	bl sub_8003D90
_080D296A:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	bl sub_8003D30
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D84
	ldr r1, _080D29BC @ =0x081F6D7C
	adds r0, r4, #0
	bl sub_8003F28
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8003F28
	adds r0, r7, #0
	adds r0, #0x64
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl sub_8001BC0
	adds r1, r0, #0
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	movs r3, #0x2a
	ldrsh r2, [r5, r3]
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D29BC: .4byte 0x081F6D7C

