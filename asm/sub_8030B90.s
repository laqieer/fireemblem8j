	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8030B90, "ax", %progbits
@ sub_8030B90 @ JP 0x08030B90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030B90
	.thumb_func
sub_8030B90:
	push {r4, lr}
	ldr r0, _08030BC0 @ =0x085C5D98
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08030BB8
	ldr r0, _08030BC4 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldr r1, _08030BC8 @ =0x08907BC8
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
_08030BB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030BC0: .4byte 0x085C5D98
_08030BC4: .4byte 0x0202BCEC
_08030BC8: .4byte 0x08907BC8

