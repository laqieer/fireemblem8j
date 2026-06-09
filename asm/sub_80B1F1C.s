	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B1F1C, "ax", %progbits
@ sub_80B1F1C @ JP 0x080B1F1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1F1C
	.thumb_func
sub_80B1F1C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080B1F3C @ =0x08A9DB84
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8002BCC
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B1F3C: .4byte 0x08A9DB84

