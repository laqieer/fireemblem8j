	.syntax unified
	.set GetCurrentPhase, 0x08024D6C + 1
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_803F2DC, "ax", %progbits
@ sub_803F2DC @ JP 0x0803F2DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F2DC
	.thumb_func
sub_803F2DC:
	push {r4, r5, lr}
	bl GetCurrentPhase
	adds r4, r0, #1
	adds r0, #0x80
	cmp r4, r0
	bge _0803F2F8
	adds r5, r0, #0
_0803F2EC:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, r5
	blt _0803F2EC
_0803F2F8:
	ldr r0, _0803F308 @ =0x0203AA00
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803F308: .4byte 0x0203AA00

