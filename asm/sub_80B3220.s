	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B3220, "ax", %progbits
@ BmBgfxSetLoopEN @ JP 0x080B3220 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BmBgfxSetLoopEN
	.thumb_func
BmBgfxSetLoopEN:
	push {r4, lr}
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	ldr r0, _080B323C @ =0x08A9DD64
	bl Proc_Find
	cmp r0, #0
	beq _080B3234
	adds r0, #0x3a
	strb r4, [r0]
_080B3234:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B323C: .4byte 0x08A9DD64

