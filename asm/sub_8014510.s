	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_8014510, "ax", %progbits
@ sub_8014510 @ JP 0x08014510 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014510
	.thumb_func
sub_8014510:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x34]
	cmp r0, r1
	blo _0801456C
	movs r0, #0
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x32]
	bl sub_80D637C
	adds r5, r0, #0
	ldrh r0, [r4, #0x3a]
	cmp r0, #0
	beq _0801453E
	mvns r0, r5
	ldrh r2, [r4, #0x32]
	adds r5, r0, r2
_0801453E:
	lsls r6, r5, #1
	ldr r0, [r4, #0x2c]
	adds r0, r0, r6
	ldrh r1, [r4, #0x30]
	ldrh r2, [r4, #0x32]
	subs r2, r2, r5
	lsls r2, r2, #1
	bl sub_8000D68
	cmp r5, #0
	ble _08014566
	ldr r0, [r4, #0x2c]
	ldrh r1, [r4, #0x32]
	lsls r1, r1, #1
	ldrh r2, [r4, #0x30]
	adds r1, r1, r2
	subs r1, r1, r6
	adds r2, r6, #0
	bl sub_8000D68
_08014566:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_0801456C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

