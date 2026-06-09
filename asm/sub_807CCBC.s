	.syntax unified
	.set NewMapPoisonEffect, 0x0807EFBC + 1
	.set sub_80142F0, 0x080142F0 + 1
	.section .text.sub_807CCBC, "ax", %progbits
@ sub_807CCBC @ JP 0x0807CCBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CCBC
	.thumb_func
sub_807CCBC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0807CCF4 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0807CCEC
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	bl NewMapPoisonEffect
	adds r0, r4, #0
	movs r1, #0x64
	bl sub_80142F0
_0807CCEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CCF4: .4byte 0x0203E1EC

