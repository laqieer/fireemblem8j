	.syntax unified
	.set SetBanimArenaFlag, 0x08070EF0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80717C0, "ax", %progbits
@ sub_80717C0 @ JP 0x080717C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80717C0
	.thumb_func
sub_80717C0:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080717DC @ =0x08603D20
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	bl SetBanimArenaFlag
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080717DC: .4byte 0x08603D20

