	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80CA618, "ax", %progbits
@ sub_80CA618 @ JP 0x080CA618 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CA618
	.thumb_func
sub_80CA618:
	push {lr}
	adds r1, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CA632
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
	b _080CA638
_080CA632:
	ldr r0, _080CA63C @ =0x08B3EDD0
	bl sub_8002BCC
_080CA638:
	pop {r0}
	bx r0
	.align 2, 0
_080CA63C: .4byte 0x08B3EDD0

