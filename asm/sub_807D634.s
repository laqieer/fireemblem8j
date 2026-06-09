	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set LoadUnits, 0x080177DC + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_807D634, "ax", %progbits
@ sub_807D634 @ JP 0x0807D634 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807D634
	.thumb_func
sub_807D634:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl AdvanceGetLCGRNValue
	movs r1, #0xb
	bl sub_80D637C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0807D6A8 @ =0x03001C48
	ldr r4, _0807D6AC @ =0x089263A8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r3, #0
	adds r1, r1, r4
	ldm r1!, {r4, r6, r7}
	stm r2!, {r4, r6, r7}
	ldm r1!, {r4, r6}
	stm r2!, {r4, r6}
	ldrb r1, [r3, #3]
	movs r2, #1
	orrs r1, r2
	movs r2, #7
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	adds r0, #5
	lsls r0, r0, #3
	movs r2, #7
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #3]
	movs r0, #0x3f
	ldrh r1, [r5, #0x3c]
	ands r1, r0
	ldrb r2, [r3, #4]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #4]
	ldr r1, [r5, #0x40]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #6
	ldrh r2, [r3, #4]
	ldr r0, _0807D6B0 @ =0xFFFFF03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	adds r0, r3, #0
	bl LoadUnits
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D6A8: .4byte 0x03001C48
_0807D6AC: .4byte 0x089263A8
_0807D6B0: .4byte 0xFFFFF03F

