	.syntax unified
	.set m4aSongNumStop, 0x080D4FC0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80396B4, "ax", %progbits
@ sub_80396B4 @ JP 0x080396B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80396B4
	.thumb_func
sub_80396B4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bgt _080396CC
	movs r0, #0x74
	bl m4aSongNumStop
	adds r0, r4, #0
	bl sub_8002DE4
	b _080396D0
_080396CC:
	subs r0, #1
	str r0, [r4, #0x3c]
_080396D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

