	.syntax unified
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_800488C, "ax", %progbits
@ sub_800488C @ JP 0x0800488C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800488C
	.thumb_func
sub_800488C:
	push {lr}
	bl sub_8000CD8
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	ldr r2, _080048AC @ =0x020228A8
	lsls r0, r0, #1
	ldr r1, _080048B0 @ =0x085C74E0
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x1c]
	bl sub_8001EE4
	pop {r0}
	bx r0
	.align 2, 0
_080048AC: .4byte 0x020228A8
_080048B0: .4byte 0x085C74E0

