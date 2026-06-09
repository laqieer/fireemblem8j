	.syntax unified
	.set GetNextUnclearedNode, 0x080C1E20 + 1
	.set WMLoc_GetChapterId, 0x080C03E0 + 1
	.set sub_80C0414, 0x080C0414 + 1
	.section .text.sub_80C2030, "ax", %progbits
@ sub_80C2030 @ JP 0x080C2030 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C2030
	.thumb_func
sub_80C2030:
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	bl GetNextUnclearedNode
	adds r1, r0, #0
	ldrb r0, [r4, #0x11]
	cmp r0, r1
	bne _080C204E
	cmp r1, #0
	blt _080C2064
	adds r0, r1, #0
	bl sub_80C0414
	b _080C205E
_080C204E:
	adds r0, r4, #0
	bl GetNextUnclearedNode
	adds r1, r0, #0
	cmp r1, #0
	bge _080C205C
	movs r1, #0
_080C205C:
	adds r0, r1, #0
_080C205E:
	bl WMLoc_GetChapterId
	adds r5, r0, #0
_080C2064:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

