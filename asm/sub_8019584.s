	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8034548, 0x08034548 + 1
	.section .text.sub_8019584, "ax", %progbits
@ sub_8019584 @ JP 0x08019584 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019584
	.thumb_func
sub_8019584:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r0, r6, #0
	bl sub_8034548
	adds r1, r4, #0
	bl sub_8013008
	ldr r5, _080195D4 @ =0x0202E4D0
	ldrb r0, [r4]
	strh r0, [r5]
	ldrb r0, [r4, #1]
	strh r0, [r5, #2]
	ldr r4, _080195D8 @ =0x08907BC8
	adds r0, r6, #0
	bl GetROMChapterStruct
	ldrb r0, [r0, #7]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080195DC @ =0x02030B88
	bl sub_8013008
	ldr r1, _080195E0 @ =0x0202BCAC
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #4
	subs r0, #0xf0
	strh r0, [r1, #0x28]
	movs r2, #2
	ldrsh r0, [r5, r2]
	lsls r0, r0, #4
	subs r0, #0xa0
	strh r0, [r1, #0x2a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080195D4: .4byte 0x0202E4D0
_080195D8: .4byte 0x08907BC8
_080195DC: .4byte 0x02030B88
_080195E0: .4byte 0x0202BCAC

