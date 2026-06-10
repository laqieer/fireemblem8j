	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.section .text.sub_80315AC, "ax", %progbits
@ sub_80315AC @ JP 0x080315AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80315AC
	.thumb_func
sub_80315AC:
	push {lr}
	ldr r0, _080315C8 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080315CC
	movs r0, #1
	b _080315CE
	.align 2, 0
_080315C8: .4byte 0x0202BCEC
_080315CC:
	movs r0, #0
_080315CE:
	pop {r1}
	bx r1
	.align 2, 0

