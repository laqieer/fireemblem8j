	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C74C0, "ax", %progbits
@ sub_80C74C0 @ JP 0x080C74C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C74C0
	.thumb_func
sub_80C74C0:
	push {lr}
	ldr r0, _080C74D0 @ =0x08AC25A8
	bl Proc_Find
	cmp r0, #0
	bne _080C74D4
	movs r0, #0
	b _080C74DC
	.align 2, 0
_080C74D0: .4byte 0x08AC25A8
_080C74D4:
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080C74DC:
	pop {r1}
	bx r1

