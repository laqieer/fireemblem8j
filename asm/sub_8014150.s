	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_8014150, "ax", %progbits
@ sub_8014150 @ JP 0x08014150 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014150
	.thumb_func
sub_8014150:
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r1, r2, #0
	adds r5, r3, #0
	ldr r7, _08014194 @ =0x080DC594
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r6, r2, #2
	adds r0, r6, r7
	ldr r2, [r0]
	ldr r0, _08014198 @ =0x085C2528
	bl sub_80D65C4
	str r4, [r0, #0x54]
	str r5, [r0, #0x4c]
	asrs r4, r4, #4
	cmp r4, #0
	bne _08014176
	movs r4, #1
_08014176:
	adds r0, r7, #4
	adds r0, r6, r0
	ldr r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	adds r0, r6, r0
	ldr r0, [r0]
	muls r0, r4, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80D65C0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014194: .4byte 0x080DC594
_08014198: .4byte 0x085C2528

