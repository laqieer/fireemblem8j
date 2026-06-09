	.syntax unified
	.set GetExtraMapMapReadAddr, 0x080AB588 + 1
	.set GetExtraMapMapSize, 0x080AB5A8 + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_8034548, "ax", %progbits
@ sub_8034548 @ JP 0x08034548 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034548
	.thumb_func
sub_8034548:
	push {r4, r5, r6, lr}
	cmp r0, #0x7f
	bne _08034574
	ldr r6, _0803456C @ =0x03006790
	bl GetExtraMapMapReadAddr
	adds r4, r0, #0
	ldr r5, _08034570 @ =0x02020188
	bl GetExtraMapMapSize
	adds r2, r0, #0
	ldr r3, [r6]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80D65C8
	adds r0, r5, #0
	b _08034582
	.align 2, 0
_0803456C: .4byte 0x03006790
_08034570: .4byte 0x02020188
_08034574:
	ldr r4, _08034588 @ =0x08907BC8
	bl GetROMChapterStruct
	ldrb r0, [r0, #8]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
_08034582:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08034588: .4byte 0x08907BC8

