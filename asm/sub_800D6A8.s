	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_800D6A8, "ax", %progbits
@ sub_800D6A8 @ JP 0x0800D6A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D6A8
	.thumb_func
sub_800D6A8:
	push {lr}
	ldr r0, _0800D6D0 @ =0x085B98A0
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	bne _0800D6C2
	ldr r0, _0800D6D4 @ =0x085B98D8
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D6CA
_0800D6C2:
	ldrh r1, [r2, #0x3c]
	movs r0, #8
	orrs r0, r1
	strh r0, [r2, #0x3c]
_0800D6CA:
	pop {r0}
	bx r0
	.align 2, 0
_0800D6D0: .4byte 0x085B98A0
_0800D6D4: .4byte 0x085B98D8

