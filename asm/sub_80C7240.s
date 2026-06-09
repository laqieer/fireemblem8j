	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C7240, "ax", %progbits
@ sub_80C7240 @ JP 0x080C7240 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7240
	.thumb_func
sub_80C7240:
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	ldr r0, _080C7260 @ =0x08AC2510
	bl Proc_Find
	cmp r0, #0
	beq _080C7258
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
_080C7258:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7260: .4byte 0x08AC2510

