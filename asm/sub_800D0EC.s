	.syntax unified
	.set nullsub_24, 0x080BD058 + 1
	.section .text.sub_800D0EC, "ax", %progbits
@ sub_800D0EC @ JP 0x0800D0EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D0EC
	.thumb_func
sub_800D0EC:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800D0FE
	bl nullsub_24
_0800D0FE:
	movs r0, #0
	pop {r1}
	bx r1

