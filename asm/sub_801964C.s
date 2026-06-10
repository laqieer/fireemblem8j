	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_801964C, "ax", %progbits
@ sub_801964C @ JP 0x0801964C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801964C
	.thumb_func
sub_801964C:
	push {r4, lr}
	ldr r4, _08019674 @ =0x08907BC8
	ldr r0, _08019678 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r0, [r0, #6]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r1, #0xc0
	bl sub_8000D68
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019674: .4byte 0x08907BC8
_08019678: .4byte 0x0202BCEC

