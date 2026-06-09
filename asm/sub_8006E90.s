	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_8006E90, "ax", %progbits
@ sub_8006E90 @ JP 0x08006E90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006E90
	.thumb_func
sub_8006E90:
	push {lr}
	cmp r0, #0
	beq _08006EB4
	ldr r0, _08006EAC @ =0x085C7520
	movs r1, #0x60
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08006EB0 @ =0x085C7500
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	b _08006EC8
	.align 2, 0
_08006EAC: .4byte 0x085C7520
_08006EB0: .4byte 0x085C7500
_08006EB4:
	ldr r0, _08006ECC @ =0x08A5A5F8
	movs r1, #0x60
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08006ED0 @ =0x085C7420
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
_08006EC8:
	pop {r0}
	bx r0
	.align 2, 0
_08006ECC: .4byte 0x08A5A5F8
_08006ED0: .4byte 0x085C7420

