	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_809C5EC, 0x0809C5EC + 1
	.section .text.sub_80A2198, "ax", %progbits
@ sub_80A2198 @ JP 0x080A2198 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2198
	.thumb_func
sub_80A2198:
	push {r4, lr}
	sub sp, #4
	ldr r0, _080A21F8 @ =0x00008840
	str r0, [sp]
	movs r0, #0xa0
	movs r1, #0x5b
	movs r2, #8
	movs r3, #4
	bl sub_809C5EC
	ldr r4, _080A21FC @ =0x085B8D24
	ldr r0, _080A2200 @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb0
	movs r2, #0x5e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080A2204 @ =0x0000B08C
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x5e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080A2208 @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x6e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080A220C @ =0x0000B084
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x6e
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A21F8: .4byte 0x00008840
_080A21FC: .4byte 0x085B8D24
_080A2200: .4byte 0x0000B088
_080A2204: .4byte 0x0000B08C
_080A2208: .4byte 0x0000B080
_080A220C: .4byte 0x0000B084

