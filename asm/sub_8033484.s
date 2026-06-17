	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.section .text.PrepHelpPrompt_Loop, "ax", %progbits
@ PrepHelpPrompt_Loop @ JP 0x08033484 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrepHelpPrompt_Loop
	.thumb_func
PrepHelpPrompt_Loop:
	push {r4, lr}
	sub sp, #4
	ldr r4, _080334F4 @ =0x085B8D24
	ldr r0, _080334F8 @ =0x0000238B
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r0, _080334FC @ =0x0000238F
	str r0, [sp]
	movs r0, #4
	movs r1, #0x60
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r3, _08033500 @ =0x085B8CE4
	ldr r0, _08033504 @ =0x00002393
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x8c
	bl PutSprite
	ldr r0, _08033508 @ =0x00002395
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa0
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r0, _0803350C @ =0x00002399
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r3, _08033510 @ =0x085B8CFC
	ldr r0, _08033514 @ =0x0000239D
	str r0, [sp]
	movs r0, #4
	movs r1, #0xe0
	movs r2, #0x8c
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080334F4: .4byte 0x085B8D24
_080334F8: .4byte 0x0000238B
_080334FC: .4byte 0x0000238F
_08033500: .4byte 0x085B8CE4
_08033504: .4byte 0x00002393
_08033508: .4byte 0x00002395
_0803350C: .4byte 0x00002399
_08033510: .4byte 0x085B8CFC
_08033514: .4byte 0x0000239D

