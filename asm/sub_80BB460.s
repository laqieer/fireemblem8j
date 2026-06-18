	.syntax unified
	.set InitText, 0x08003C8C + 1
	.set ResetText, 0x08003BC4 + 1
	.section .text.sub_80BB460, "ax", %progbits
@ InitCharacterEndingText @ JP 0x080BB460 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global InitCharacterEndingText
	.thumb_func
InitCharacterEndingText:
	push {r4, r5, r6, r7, lr}
	bl ResetText
	ldr r7, _080BB4A8 @ =0x08AC0B90
	movs r6, #0x38
	movs r5, #0x28
	movs r4, #1
_080BB46E:
	ldr r0, [r7]
	adds r0, r0, r5
	movs r1, #0xf
	bl InitText
	ldr r0, [r7]
	adds r0, r0, r6
	movs r1, #0xa
	bl InitText
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080BB46E
	movs r4, #0
	ldr r5, _080BB4A8 @ =0x08AC0B90
_080BB490:
	lsls r1, r4, #3
	ldr r0, [r5]
	adds r0, r0, r1
	movs r1, #0x19
	bl InitText
	adds r4, #1
	cmp r4, #4
	ble _080BB490
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB4A8: .4byte 0x08AC0B90

