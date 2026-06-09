	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_8003750, 0x08003750 + 1
	.section .text.sub_801BCEC, "ax", %progbits
@ sub_801BCEC @ JP 0x0801BCEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BCEC
	.thumb_func
sub_801BCEC:
	push {r4, lr}
	ldr r1, _0801BD14 @ =0x03001778
	ldr r0, _0801BD18 @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	strb r0, [r1]
	ldr r4, _0801BD1C @ =0x02022D76
	movs r0, #0
	bl GetROMChapterStruct
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_8003750
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801BD14: .4byte 0x03001778
_0801BD18: .4byte 0x0202BCEC
_0801BD1C: .4byte 0x02022D76

