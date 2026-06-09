	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80B8CF0, 0x080B8CF0 + 1
	.section .text.sub_80B8EB4, "ax", %progbits
@ sub_80B8EB4 @ JP 0x080B8EB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8EB4
	.thumb_func
sub_80B8EB4:
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	bne _080B8EC8
	adds r0, r1, #0
	movs r1, #0xd
	bl Proc_Goto
	b _080B8ECE
_080B8EC8:
	ldr r0, _080B8ED4 @ =0x0000083A
	bl sub_80B8CF0
_080B8ECE:
	pop {r0}
	bx r0
	.align 2, 0
_080B8ED4: .4byte 0x0000083A

