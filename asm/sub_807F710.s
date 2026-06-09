	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutTmRectSequential, 0x08014574 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.section .text.sub_807F710, "ax", %progbits
@ sub_807F710 @ JP 0x0807F710 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807F710
	.thumb_func
sub_807F710:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0807F748 @ =0x02023CA8
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	ldr r3, _0807F74C @ =0x00004140
	ldr r4, [r5, #0x54]
	str r4, [sp]
	str r4, [sp, #4]
	bl PutTmRectSequential
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r5, #0x64
	movs r0, #0
	strh r0, [r5]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F748: .4byte 0x02023CA8
_0807F74C: .4byte 0x00004140

