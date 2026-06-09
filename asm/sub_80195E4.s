	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80195E4, "ax", %progbits
@ sub_80195E4 @ JP 0x080195E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80195E4
	.thumb_func
sub_80195E4:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08019640 @ =0x08907BC8
	bl GetROMChapterStruct
	ldrb r0, [r0, #4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _08019644 @ =0x06008000
	bl sub_8013008
	adds r0, r4, #0
	bl GetROMChapterStruct
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _08019622
	adds r0, r4, #0
	bl GetROMChapterStruct
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _08019648 @ =0x0600C000
	bl sub_8013008
_08019622:
	adds r0, r4, #0
	bl GetROMChapterStruct
	ldrb r0, [r0, #6]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r1, #0xc0
	bl sub_8000D68
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019640: .4byte 0x08907BC8
_08019644: .4byte 0x06008000
_08019648: .4byte 0x0600C000

