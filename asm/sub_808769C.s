	.syntax unified
	.set SetNextGameActionId, 0x08009EB0 + 1
	.set sub_803113C, 0x0803113C + 1
	.section .text.sub_808769C, "ax", %progbits
@ sub_808769C @ JP 0x0808769C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808769C
	.thumb_func
sub_808769C:
	push {lr}
	movs r0, #0
	bl SetNextGameActionId
	bl sub_803113C
	bl DeleteEventEngines
	pop {r0}
	bx r0

