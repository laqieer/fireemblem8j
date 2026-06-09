	.syntax unified
	.set StartArenaDialogue, 0x080BA788 + 1
	.section .text.sub_80BA51C, "ax", %progbits
@ sub_80BA51C @ JP 0x080BA51C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA51C
	.thumb_func
sub_80BA51C:
	push {lr}
	adds r2, r0, #0
	ldr r0, _080BA53C @ =0x0203A8EC
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	cmp r0, #4
	bhi _080BA540
	movs r0, #0x87
	lsls r0, r0, #4
	adds r1, r2, #0
	bl StartArenaDialogue
	b _080BA548
	.align 2, 0
_080BA53C: .4byte 0x0203A8EC
_080BA540:
	ldr r0, _080BA54C @ =0x00000871
	adds r1, r2, #0
	bl StartArenaDialogue
_080BA548:
	pop {r0}
	bx r0
	.align 2, 0
_080BA54C: .4byte 0x00000871

