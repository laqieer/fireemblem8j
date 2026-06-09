	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80BD56C, "ax", %progbits
@ sub_80BD56C @ JP 0x080BD56C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD56C
	.thumb_func
sub_80BD56C:
	push {r4, lr}
	ldr r4, _080BD584 @ =0x08AC10C0
	adds r0, r4, #0
	bl Proc_Find
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	bne _080BD588
	movs r0, #0x10
	b _080BD58E
	.align 2, 0
_080BD584: .4byte 0x08AC10C0
_080BD588:
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #1
_080BD58E:
	pop {r4}
	pop {r1}
	bx r1

