	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80C95AC, "ax", %progbits
@ sub_80C95AC @ JP 0x080C95AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C95AC
	.thumb_func
sub_80C95AC:
	push {lr}
	sub sp, #4
	ldr r0, _080C9618 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080C961C @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080C9620 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _080C9624 @ =0x01006000
	mov r0, sp
	bl sub_80D636C
	ldr r2, _080C9628 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	ldr r0, _080C962C @ =0x020244A8
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80011D0
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080C9618: .4byte 0x02022CA8
_080C961C: .4byte 0x020234A8
_080C9620: .4byte 0x02023CA8
_080C9624: .4byte 0x01006000
_080C9628: .4byte 0x03003020
_080C962C: .4byte 0x020244A8

