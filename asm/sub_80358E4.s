	.syntax unified
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8019994, 0x08019994 + 1
	.section .text.sub_80358E4, "ax", %progbits
@ sub_80358E4 @ JP 0x080358E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80358E4
	.thumb_func
sub_80358E4:
	push {lr}
	bl sub_8018E64
	cmp r0, #0
	bne _080358FA
	ldr r0, _08035900 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080358FA
	bl sub_8019994
_080358FA:
	pop {r0}
	bx r0
	.align 2, 0
_08035900: .4byte 0x0202BCEC

